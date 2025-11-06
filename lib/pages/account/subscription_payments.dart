import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/entities/purchase/purchase.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/services/revenue_cat_service.dart';
import 'package:ab_shared/services/user.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:ab_shared/utils/toast_helper.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionPayments extends StatefulWidget {
  SubscriptionPayments({super.key}) {}

  @override
  State<SubscriptionPayments> createState() => _SubscriptionPaymentsState();
}

class _SubscriptionPaymentsState extends State<SubscriptionPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(CupertinoIcons.creditcard),
            SizedBox(width: $constants.insets.sm),
            Text(
              context.t.account.subscription_payments.title,
              style: getTextTheme(
                context,
              ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ToastHelper.showError(
              context: context,
              title:
                  context
                      .t
                      .account
                      .subscription_payments
                      .cant_load_customer_portal,
            );
          } else if (state is CustomerPortalLoaded) {
            launchUrl(
              Uri.parse(state.portalUrl),
              mode: LaunchMode.inAppWebView,
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            return Column(
              children: [
                if (authState.appConfig?.paymentEnabled != true)
                  Padding(
                    padding: EdgeInsets.all($constants.insets.md),
                    child: Text(
                      context.t.account.subscription_payments.payment_disabled,
                      style: getTextTheme(context).bodyMedium,
                    ),
                  ),
                if (authState.appConfig?.paymentEnabled == true)
                  Padding(
                    padding: EdgeInsets.all($constants.insets.md),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //TODO: add stripe logo
                            Image.asset(
                              'assets/images/stripe_logo.png',
                              package: 'ab_shared',
                              height: 70,
                            ),
                            SizedBox(width: $constants.insets.md),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context
                                      .t
                                      .account
                                      .subscription_payments
                                      .payment_provider,
                                  style: getTextTheme(context).bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: $constants.insets.sm),
                                Text(
                                  context
                                      .t
                                      .account
                                      .subscription_payments
                                      .stripe_description,
                                  style: getTextTheme(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: $constants.insets.md),
                        PrimaryButtonSquare(
                          leading:
                              authState is CustomerPortalLoading
                                  ? SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: getTheme(context).primary,
                                    ),
                                  )
                                  : null,
                          onPressed: () async {
                            context.read<AuthBloc>().add(
                              const CustomerPortal(),
                            );
                          },
                          width: getSize(context).width * 0.3,
                          outlined: true,
                          text:
                              context
                                  .t
                                  .account
                                  .subscription_payments
                                  .manage_my_subscription,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
