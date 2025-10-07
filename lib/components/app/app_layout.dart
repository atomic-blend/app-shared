import 'dart:io';

import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/app/ab_sidemenu.dart';
import 'package:ab_shared/pages/auth/sso_module.dart';
import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/responsive_stateful_widget.dart';
import 'package:ab_shared/pages/paywall/paywall_utils.dart';
import 'package:ab_shared/services/device_info.service.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:macos_window_utils/widgets/titlebar_safe_area.dart';
import 'package:ab_shared/components/ab_toast.dart';

/// A reusable app layout component that provides a consistent structure
/// for mobile and desktop applications with navigation, side menus, and toast notifications.
///
/// This component is designed to be flexible and configurable, allowing different
/// apps to provide their own navigation items, services, and components.
///
/// Example usage:
/// ```dart
/// AppLayout(
///   primaryMenuItems: myNavigationItems,
///   authBloc: myAuthBloc,
///   appCubit: myAppCubit,
///   sideMenuController: SideMenuController(),
///   abToastController: ABToastController(),
///   encryptionService: myEncryptionService,
///   globalApiClient: myApiClient,
///   prefs: myPrefs,
///   env: myEnv,
///   composerWidget: MyComposerWidget(),
///   centerActionCallback: () => showMyComposer(),
///   centerActionIcon: Icons.add,
/// )
/// ```
class AppLayout extends ResponsiveStatefulWidget {
  /// List of primary navigation menu items
  final List<NavigationItem> primaryMenuItems;

  /// Authentication bloc for managing user state
  final AuthBloc authBloc;

  /// App state cubit for managing navigation state
  final dynamic appCubit;

  /// Encryption service instance
  final EncryptionService? encryptionService;

  /// Global API client instance
  final dynamic globalApiClient;

  /// Shared preferences instance
  final dynamic prefs;

  /// Environment configuration
  final dynamic env;

  /// User key for encryption
  final String? userKey;

  /// Age public key for encryption
  final String? agePublicKey;

  /// Revenue cat service instance
  final dynamic revenueCatService;

  /// Side menu controller
  final SideMenuController sideMenuController;

  /// Toast controller
  final ABToastController abToastController;

  /// Custom SSO module widget
  final Widget? ssoModule;

  const AppLayout({
    super.key,
    required this.primaryMenuItems,
    required this.authBloc,
    required this.appCubit,
    required this.sideMenuController,
    required this.abToastController,
    this.encryptionService,
    this.globalApiClient,
    this.prefs,
    this.env,
    this.userKey,
    this.agePublicKey,
    this.revenueCatService,
    this.ssoModule,
  });

  @override
  AppLayoutState createState() => AppLayoutState();
}

class AppLayoutState extends ResponsiveState<AppLayout> {
  @override
  void initState() {
    widget.authBloc.add(const RefreshUser());
    if (widget.prefs != null) {
      PaywallUtils.resetPaywall(prefs: widget.prefs!);
    }

    if (widget.authBloc.state.user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (widget.authBloc.state.user?.devices == null) {
          widget.authBloc.state.user?.devices = [];
        }
        final deviceInfoService = DeviceInfoService();
        final userDeviceInfo = await deviceInfoService.getDeviceInfo();

        if (!context.mounted) return;
        // ignore: use_build_context_synchronously
        widget.authBloc.add(
          UpdateUserDevice(
            // ignore: use_build_context_synchronously
            widget.authBloc.state.user!,
            userDeviceInfo,
          ),
        );
        // }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = buildMobile(context);
    if (isDesktop(context)) {
      body = buildDesktop(context);
    }
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! LoggedIn) {
          return Scaffold(
            body:
                widget.ssoModule ??
                SSOModule(
                  encryptionService: widget.encryptionService,
                  globalApiClient: widget.globalApiClient,
                  prefs: widget.prefs,
                  env: widget.env,
                ),
          );
        }
        return body;
      },
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return BlocBuilder(
      bloc: widget.appCubit,
      builder: (context, appState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            _runAppInitAndChecks(context: context, authState: authState);

            if (authState is! LoggedIn) {
              return Scaffold(
                body:
                    widget.ssoModule ??
                    SSOModule(
                      encryptionService: widget.encryptionService,
                      globalApiClient: widget.globalApiClient,
                      prefs: widget.prefs,
                      env: widget.env,
                    ),
              );
            }

            var primaryMenuItems = widget.primaryMenuItems;

            // get the primary menu item and its secondary items
            var primaryMenuItem =
                primaryMenuItems
                    .where(
                      (item) =>
                          (item.key as ValueKey).value ==
                          (appState as dynamic)?.primaryMenuSelectedKey,
                    )
                    .firstOrNull;
            final secondaryItems = primaryMenuItem?.subItems ?? [];
            // by default, the primary menu is selected
            Widget? body = primaryMenuItem?.body;
            AppBar? appBar = primaryMenuItem?.appBar;
            Widget? header = primaryMenuItem?.header;
            NavigationAction? action = primaryMenuItem?.action;

            // select the items if there's a secondary menu and a secondary menu item is selected
            if (secondaryItems.isNotEmpty &&
                (appState as dynamic)?.secondaryMenuSelectedKey != '') {
              body =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.body;

              header =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.header;

              final secondaryAppBar =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.appBar;

              // use the secondary appBar if it exists, else let the parent appBar
              if (secondaryAppBar != null) {
                appBar = secondaryAppBar;
              }
              final secondaryAction =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.action;
              if (secondaryAction != null) {
                action = secondaryAction;
              }
            }

            final drawer = TapRegion(
              onTapOutside: (_) {
                Navigator.of(context).pop();
              },
              child: ABSideMenu(
                controller: widget.sideMenuController,
                primaryMenuItems: primaryMenuItems,
                primaryMenuKey: (appState as dynamic)?.primaryMenuSelectedKey,
                actionWidget:
                    action != null
                        ? _buildActionButtonSideMenu(context, action)
                        : null,
                secondaryMenuKey:
                    (appState as dynamic)?.secondaryMenuSelectedKey,
                onItemTap: (item) {
                  if (item.onTap != null) {
                    item.onTap!(0);
                    return;
                  }
                  widget.appCubit.changePrimaryMenuSelectedKey(
                    key: (item.key as ValueKey).value,
                  );
                  if (item.mainSecondaryKey != null) {
                    widget.appCubit.changeSecondaryMenuSelectedKey(
                      key: item.mainSecondaryKey!,
                    );
                  }
                  Navigator.of(context).pop();
                },
                onSubItemTap: (item, subItem) {
                  if (item.onTap != null) {
                    subItem.onTap!(0);
                    return;
                  }
                  widget.appCubit.changePrimaryMenuSelectedKey(
                    key: (item.key as ValueKey).value,
                  );
                  widget.appCubit.changeSecondaryMenuSelectedKey(
                    key: (subItem.key as ValueKey).value,
                  );
                  Navigator.of(context).pop();
                },
              ),
            );

            return Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Scaffold(
                    // if there's secondary, show the secondary item appBar
                    // else show the primary appBar
                    appBar: appBar,
                    drawer: drawer,
                    backgroundColor: getTheme(context).surface,
                    body: SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              header ?? Container(),
                              Expanded(child: body ?? Container()),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 80),
                              child: ABToastDisplay(
                                controller: widget.abToastController,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: $constants.insets.md,
                              ),
                              child: ABNavbar(
                                backgroundColor: getTheme(context).surface,
                                onPrimaryMenuSelected: (key) {
                                  widget.appCubit.changePrimaryMenuSelectedKey(
                                    key: key,
                                  );
                                },
                                onSecondaryMenuSelected: (key) {
                                  widget.appCubit
                                      .changeSecondaryMenuSelectedKey(key: key);
                                },
                                destinations: widget.primaryMenuItems,
                                primaryMenuKey:
                                    (appState as dynamic)
                                        ?.primaryMenuSelectedKey,
                                centerActionEnabled: action != null,
                                centerActionIcon: action?.icon,
                                centerActionCallback: action?.onTap,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return BlocBuilder(
      bloc: widget.appCubit,
      builder: (context, appState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            _runAppInitAndChecks(context: context, authState: authState);

            // get the secondary items from the selected primary menu item
            final primaryMenuItem =
                widget.primaryMenuItems
                    .where(
                      (item) =>
                          (item.key as ValueKey).value ==
                          (appState as dynamic)?.primaryMenuSelectedKey,
                    )
                    .firstOrNull;
            final secondaryItems = primaryMenuItem?.subItems ?? [];

            // by default, the primary menu is selected
            Widget? body =
                widget.primaryMenuItems
                    .where(
                      (item) =>
                          (item.key as ValueKey).value ==
                          (appState as dynamic)?.primaryMenuSelectedKey,
                    )
                    .firstOrNull
                    ?.body;
            Widget? header =
                widget.primaryMenuItems
                    .where(
                      (item) =>
                          (item.key as ValueKey).value ==
                          (appState as dynamic)?.primaryMenuSelectedKey,
                    )
                    .firstOrNull
                    ?.header;

            AppBar? appBar =
                widget.primaryMenuItems
                    .where(
                      (item) =>
                          (item.key as ValueKey).value ==
                          (appState as dynamic)?.primaryMenuSelectedKey,
                    )
                    .firstOrNull
                    ?.appBar;

            NavigationAction? action =
                widget.primaryMenuItems
                    .where(
                      (item) =>
                          (item.key as ValueKey).value ==
                          (appState as dynamic)?.primaryMenuSelectedKey,
                    )
                    .firstOrNull
                    ?.action;

            // on desktop, move the 4th primary menu item to the end of the list
            final primaryMenuItems = widget.primaryMenuItems.toList();
            if (primaryMenuItems.length > 4) {
              final itemToMove = primaryMenuItems.removeAt(4);
              primaryMenuItems.add(itemToMove);
            }

            // select the items if there's a secondary menu and a secondary menu item is selected
            if (secondaryItems.isNotEmpty &&
                (appState as dynamic)?.secondaryMenuSelectedKey != '') {
              body =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.body;

              header =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.header;

              final secondaryAppBar =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.appBar;

              // use the secondary appBar if it exists, else let the parent appBar
              if (secondaryAppBar != null) {
                appBar = secondaryAppBar;
              }
              final secondaryAction =
                  secondaryItems
                      .where(
                        (item) =>
                            (item.key as ValueKey).value ==
                            (appState as dynamic)?.secondaryMenuSelectedKey,
                      )
                      .firstOrNull
                      ?.action;
              if (secondaryAction != null) {
                action = secondaryAction;
              }
            }

            final renderedBody = Stack(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    // primary menu items
                    ABSideMenu(
                      controller: widget.sideMenuController,
                      primaryMenuItems: primaryMenuItems,
                      primaryMenuKey:
                          (appState as dynamic)?.primaryMenuSelectedKey,
                      secondaryMenuKey:
                          (appState as dynamic)?.secondaryMenuSelectedKey,
                      actionWidget:
                          action != null
                              ? _buildActionButtonSideMenu(context, action)
                              : null,
                      onItemTap: (item) {
                        if (item.onTap != null) {
                          item.onTap!(0);
                          return;
                        }
                        widget.appCubit.changePrimaryMenuSelectedKey(
                          key: (item.key as ValueKey).value,
                        );
                        if (item.mainSecondaryKey != null) {
                          widget.appCubit.changeSecondaryMenuSelectedKey(
                            key: item.mainSecondaryKey!,
                          );
                        }
                      },
                      onSubItemTap: (item, subItem) {
                        if (item.onTap != null) {
                          subItem.onTap!(0);
                          return;
                        }
                        widget.appCubit.changePrimaryMenuSelectedKey(
                          key: (item.key as ValueKey).value,
                        );
                        widget.appCubit.changeSecondaryMenuSelectedKey(
                          key: (subItem.key as ValueKey).value,
                        );
                      },
                    ),
                    Expanded(
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          // secondary menu items
                          Expanded(
                            child: Scaffold(
                              // if there's secondary, show the secondary item appBar
                              // else show the primary appBar
                              appBar: appBar,
                              // if there's secondary, show the secondary item body
                              // else show the primary item body
                              body: Column(
                                children: [
                                  header ?? Container(),
                                  Expanded(child: body ?? Container()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: $constants.insets.sm,
                      right: $constants.insets.sm,
                    ),
                    child: ABToastDisplay(controller: widget.abToastController),
                  ),
                ),
              ],
            );

            // Note: TitlebarSafeArea would need to be provided by the parent app
            if (!kIsWeb && Platform.isMacOS) {
              return TitlebarSafeArea(child: renderedBody);
            }
            return SafeArea(child: renderedBody);
          },
        );
      },
    );
  }

  Widget _buildActionButtonSideMenu(
    BuildContext context,
    NavigationAction action,
  ) {
    return GestureDetector(
      onTap: action.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.xs,
          vertical: $constants.insets.xxs,
        ),
        child: Container(
          padding: EdgeInsets.all($constants.insets.xs),
          decoration: BoxDecoration(
            color: getTheme(context).primary,
            borderRadius: BorderRadius.circular($constants.corners.sm),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...[
                Icon(action.icon, color: getTheme(context).onPrimary),
                SizedBox(width: $constants.insets.sm),
              ],
              Text(
                action.label,
                style: getTextTheme(context).bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: getTheme(context).onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _runAppInitAndChecks({
    required BuildContext context,
    required AuthState authState,
  }) {
    if (authState is LoggedIn) {
      if (widget.encryptionService == null && widget.prefs != null) {
        // Note: This would need to be handled by the parent widget
        // as we can't modify the encryptionService here since it's final
      }
      if (isPaymentSupported() && widget.revenueCatService != null) {
        widget.revenueCatService.logIn(authState.user!.id!);
      }
    }
  }
}
