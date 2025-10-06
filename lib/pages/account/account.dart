import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/ab_button.dart';
import 'package:ab_shared/components/buttons/icon_text_button.dart';
import 'package:ab_shared/components/buttons/primary_button_round.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/modals/delete_account_modal.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/account/profile.dart';
import 'package:ab_shared/pages/account/security.dart';
import 'package:ab_shared/pages/account/subscription_payments.dart';
import 'package:ab_shared/pages/paywall/paywall_utils.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/services/revenue_cat_service.dart';
import 'package:ab_shared/services/user.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/name_generator.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  final ApiClient? globalApiClient;
  final EncryptionService? encryptionService;
  final RevenueCatService? revenueCatService;
  final SharedPreferences? prefs;
  const Account({
    super.key,
    this.globalApiClient,
    this.encryptionService,
    this.revenueCatService,
    this.prefs,
  });

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Widget? selectedItem;

  @override
  void initState() {
    context.read<AuthBloc>().add(const RefreshUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authstate) {
            return SizedBox(
              width: isDesktop(context) ? 300 : getSize(context).width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedContainer(
                      disableShadow: true,
                      borderRadius: $constants.corners.md,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: $constants.insets.sm,
                              horizontal: $constants.insets.sm,
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    context.read<AuthBloc>().add(
                                      const Logout(),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: ABButton(
                                    icon: CupertinoIcons.person,
                                    backgroundColor: getTheme(context).error,
                                    textColor: getTheme(context).onError,
                                    label: context.t.settings.logout,
                                    onTap: () {
                                      context.read<AuthBloc>().add(
                                        const Logout(),
                                      );
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: $constants.insets.xs),
                          SizedBox(
                            height: getSize(context).height * 0.1,
                            width: getSize(context).width * 0.2,
                            child: RandomAvatar(authstate.user?.email ?? ""),
                          ),
                          SizedBox(height: $constants.insets.xs),
                          Text(
                            authstate.user?.firstname ??
                                NameGenerator.generate(context),
                            style: getTextTheme(
                              context,
                            ).titleSmall!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(authstate.user?.email ?? ""),
                          SizedBox(height: $constants.insets.sm),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return PrimaryButtonSquare(
                                height: 35,
                                width: constraints.maxWidth * 0.8,
                                trailing: Icon(
                                  CupertinoIcons.chevron_right,
                                  size: 12,
                                  color: getTheme(context).surface,
                                ),
                                text: context.t.account.edit_profile,
                                onPressed: () {
                                  if (isDesktop(context)) {
                                    setState(() {
                                      selectedItem = const UserProfile();
                                    });
                                  } else {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const UserProfile(),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(height: $constants.insets.sm),
                        ],
                      ),
                    ),
                    SizedBox(height: $constants.insets.sm),
                    Text(
                      context.t.account.sections.account,
                      style: getTextTheme(
                        context,
                      ).labelMedium!.copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: $constants.insets.xs),
                    if (widget.globalApiClient?.getSelfHostedRestApiUrl() ==
                        null) ...[
                      IconTextButton(
                        icon: CupertinoIcons.star_fill,
                        iconContainer: true,
                        iconSize: 20,
                        iconColor: Colors.grey[700],
                        text: context.t.account.subscription_payments.title,
                        onTap: () {
                          if (UserService.isSubscriptionActive(
                            widget.globalApiClient!,
                            authstate.user,
                          )) {
                            if (isDesktop(context)) {
                              setState(() {
                                selectedItem = SubscriptionPayments(
                                  revenueCatService: widget.revenueCatService,
                                );
                              });
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => SubscriptionPayments(
                                        revenueCatService:
                                            widget.revenueCatService,
                                      ),
                                ),
                              );
                            }
                          } else {
                            if (widget.revenueCatService != null) {
                              PaywallUtils.showPaywall(
                                context,
                                globalApiClient: widget.globalApiClient!,
                                prefs: widget.prefs!,
                                user: authstate.user,
                                revenueCatService: widget.revenueCatService!,
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: $constants.insets.sm),
                    ],
                    IconTextButton(
                      icon: CupertinoIcons.lock,
                      iconContainer: true,
                      iconSize: 20,
                      iconColor: Colors.grey[700],
                      text: context.t.account.actions.security,
                      onTap: () {
                        if (isDesktop(context)) {
                          setState(() {
                            selectedItem = Security(
                              encryptionService: widget.encryptionService!,
                            );
                          });
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => Security(
                                    encryptionService:
                                        widget.encryptionService!,
                                  ),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: $constants.insets.sm),
                    IconTextButton(
                      icon: CupertinoIcons.delete,
                      iconContainer: true,
                      iconSize: 20,
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      text: context.t.account.actions.delete_account,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const DeleteAccountModal();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        if (isDesktop(context)) ...[
          VerticalDivider(
            color: getTheme(context).surfaceContainer,
            thickness: 1,
          ),
          Expanded(child: selectedItem ?? Container()),
        ],
      ],
    );
  }
}
