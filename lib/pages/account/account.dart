import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/icon_text_button.dart';
import 'package:ab_shared/components/buttons/primary_button_round.dart';
import 'package:ab_shared/components/modals/delete_account_modal.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  final ApiClient globalApiClient;
  final EncryptionService encryptionService;
  final RevenueCatService revenueCatService;  
  final SharedPreferences prefs;
  const Account({super.key, required this.globalApiClient, required this.encryptionService, required this.revenueCatService, required this.prefs});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const RefreshUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authstate) {
      return SizedBox(
        width: double.infinity,
        height: getSize(context).height * 0.87,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: $constants.insets.md,
                        horizontal: $constants.insets.sm),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(CupertinoIcons.arrow_left)),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              context.read<AuthBloc>().add(const Logout());
                              Navigator.of(context).pop();
                            },
                            child: Text(context.t.settings.logout))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  SizedBox(
                    height: getSize(context).height * 0.1,
                    width: getSize(context).width * 0.2,
                    child: RandomAvatar(authstate.user?.email ?? ""),
                  ),
                  Text(
                    authstate.user?.firstname ??
                        NameGenerator.generate(context),
                    style: getTextTheme(context).titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(authstate.user?.email ?? ""),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  PrimaryButtonRound(
                    height: 35,
                    trailing: Icon(
                      CupertinoIcons.chevron_right,
                      size: 12,
                      color: getTheme(context).surface,
                    ),
                    text: context.t.account.edit_profile,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UserProfile(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: $constants.insets.lg,
                  ),
                ],
              ),
              Text(
                context.t.account.sections.account,
                style: getTextTheme(context)
                    .labelMedium!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: $constants.insets.xs,
              ),
              if (widget.globalApiClient.getSelfHostedRestApiUrl() == null) ...[
                IconTextButton(
                  icon: CupertinoIcons.star_fill,
                  iconContainer: true,
                  iconSize: 20,
                  iconColor: Colors.grey[700],
                  text: context.t.account.subscription_payments.title,
                  onTap: () {
                    if (UserService.isSubscriptionActive(widget.globalApiClient, authstate.user)) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SubscriptionPayments(
                            revenueCatService: widget.revenueCatService,
                          ),
                        ),
                      );
                    } else {
                      PaywallUtils.showPaywall(context, globalApiClient: widget.globalApiClient, prefs: widget.prefs, user: authstate.user, revenueCatService: widget.revenueCatService,);
                    }
                  },
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
              ],
              IconTextButton(
                icon: CupertinoIcons.lock,
                iconContainer: true,
                iconSize: 20,
                iconColor: Colors.grey[700],
                text: context.t.account.actions.security,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Security(
                        encryptionService: widget.encryptionService,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
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
              )
            ],
          ),
        ),
      );
    });
  }
}
