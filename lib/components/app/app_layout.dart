import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/ab_toast.dart';
import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/app/ab_sidemenu.dart';
import 'package:ab_shared/pages/auth/screens/login.dart';
import 'package:ab_shared/pages/paywall/paywall_utils.dart';
import 'package:ab_shared/services/device_info.service.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/services/user.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLayout extends StatefulWidget {
  final List<NavigationItem> items;
  final Widget child;
  final String homeRouteLocation;

  const AppLayout({
    super.key,
    required this.items,
    required this.child,
    required this.homeRouteLocation,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final getIt = GetIt.instance;
  late final EncryptionService encryptionService;
  late final ApiClient globalApiClient;
  late final SharedPreferences prefs;
  late final EnvModel? env;

  @override
  void initState() {
    super.initState();
    encryptionService = getIt<EncryptionService>();
    globalApiClient = getIt<ApiClient>();
    prefs = getIt<SharedPreferences>();
    env = getIt<EnvModel>();
    if (isPaymentSupported()) {
      PaywallUtils.resetPaywall();
    }

    context.read<AuthBloc>().add(RefreshUser());
    context.read<AuthBloc>().add(LoadConfig());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if ([LoggedOut, AuthActionLoading, AuthError].contains(authState.runtimeType)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            LoginRoute(
              LoginParams(homeRouteLocation: widget.homeRouteLocation),
            ).go(context);
          });
          return Container();
        }

        // Check subscription and redirect to paywall if needed
        final currentLocation = GoRouterState.of(context).uri.path;
        final isOnPaywall = currentLocation.startsWith('/paywall');
        final isOnAuthPages = currentLocation.startsWith('/auth');

        if (!isOnPaywall && !isOnAuthPages && authState.user != null) {
          if (authState.appConfig?.paymentEnabled == true) {
            final isSubscriptionActive = UserService.isSubscriptionActive(
              globalApiClient,
              authState.user,
            );

            if (!isSubscriptionActive) {
              // User doesn't have subscription, redirect to paywall
              WidgetsBinding.instance.addPostFrameCallback((_) {
                getIt<GoRouter>().go('/paywall');
              });
              // Return empty container while redirecting
              return Container();
            }
          }
        }

        if (authState.user != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            authState.user?.devices ??= [];
            final deviceInfoService = DeviceInfoService();
            final userDeviceInfo = await deviceInfoService.getDeviceInfo();

            if (authState.user?.devices?.any(
                  (device) => device.deviceId == userDeviceInfo.deviceId,
                ) ??
                false) {
              return;
            }
            if (!context.mounted) return;
            // ignore: use_build_context_synchronously
            context.read<AuthBloc>().add(
              UpdateUserDevice(
                // ignore: use_build_context_synchronously
                authState.user!,
                userDeviceInfo,
              ),
            );
          });
        }

        return isDesktop(context)
            ? _buildDesktop(context)
            : _buildMobile(context);
      },
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            top: isTablet(context),
            bottom: isTablet(context),
            left: isTablet(context),
            right: isTablet(context),
            child: Row(
              children: [
                if (isDesktop(context))
                  wrapTitlebarSafeArea(
                    context,
                    SizedBox(
                      height: double.infinity,
                      child: ABSideMenu(
                        controller: getIt<SideMenuController>(),
                        items: widget.items,
                      ),
                    ),
                  ),
                Expanded(
                  child: Scaffold(
                    body: Column(
                      children: [
                        _getHeader(context),
                        Expanded(child: widget.child),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: $constants.insets.sm,
              right: $constants.insets.sm,
            ),
            child: ABToastDisplay(controller: getIt<ABToastController>()),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    // Always create a fresh GlobalKey to avoid stale references
    final scaffoldKey = GlobalKey<ScaffoldState>();

    // Update the singleton with the new key
    if (getIt.isRegistered<GlobalKey<ScaffoldState>>()) {
      getIt.unregister<GlobalKey<ScaffoldState>>(
        instanceName: 'layoutScaffoldKey',
      );
    }
    getIt.registerSingleton<GlobalKey<ScaffoldState>>(
      scaffoldKey,
      instanceName: 'layoutScaffoldKey',
    );
    return Scaffold(
      drawer: ABSideMenu(
        controller: getIt<SideMenuController>(),
        items: widget.items,
      ),
      // key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [_getHeader(context), Expanded(child: widget.child)],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: ABToastDisplay(controller: getIt<ABToastController>()),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
                child: ABNavbar(
                  backgroundColor: getTheme(context).surface,
                  destinations: widget.items,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeader(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final item = _findNavigationItemByLocation(widget.items, location);
    return item?.header ?? Container();
  }

  NavigationItem? _findNavigationItemByLocation(
    List<NavigationItem> items,
    String location,
  ) {
    for (final item in items) {
      // First, recursively search in subitems (children)
      if (item.subItems != null) {
        final foundItem = _findNavigationItemByLocation(
          item.subItems!,
          location,
        );
        if (foundItem != null) {
          return foundItem;
        }
      }

      // Then check if current item (parent) matches
      if (item.location == location) {
        return item;
      }
    }
    return null;
  }
}
