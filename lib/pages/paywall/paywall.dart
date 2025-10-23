import 'dart:async';

import 'package:ab_shared/services/revenue_cat_service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/services/user.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class Paywall extends StatefulWidget {
  final getIt = GetIt.instance;
  late final RevenueCatService revenueCatService;
  late final ApiClient globalApiClient;
  Paywall({super.key}) {
    globalApiClient = getIt<ApiClient>();
  }

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  bool? _isMakingPurchase;
  Timer? _checkPurchaseTimer;
  bool? _purchaseSuccess;
  bool? _purchaseFailed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
        'Paywall: Building widget - purchaseSuccess: $_purchaseSuccess, purchaseFailed: $_purchaseFailed, isMakingPurchase: $_isMakingPurchase',
      );
    }

    if (_purchaseSuccess == true) {
      Navigator.of(context).pop();
    } else if (_purchaseFailed == true) {
      return _buildPurchaseFailed(context);
    } else if (_isMakingPurchase == true || _checkPurchaseTimer != null) {
      return _buildPurchaseLoading(context);
    }
    return Padding(
      padding: EdgeInsets.all($constants.insets.md),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getSize(context).height * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: getSize(context).height * 0.1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          $constants.corners.xl,
                        ),
                        child: Image.asset(
                          'assets/images/atomic_blend_logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: $constants.insets.md),
                    Text(
                      context.t.paywall.title,
                      style: getTextTheme(
                        context,
                      ).headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      context.t.paywall.subtitle,
                      textAlign: TextAlign.center,
                      style: getTextTheme(
                        context,
                      ).bodyMedium?.copyWith(color: Colors.grey.shade600),
                    ),
                    SizedBox(height: $constants.insets.md),
                    ElevatedContainer(
                      width: double.infinity,
                      borderRadius: $constants.corners.sm,
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.md,
                        vertical: $constants.insets.md,
                      ),
                      child: Column(
                        spacing: $constants.insets.md,
                        children: [
                          _buildAdvantageRow(
                            title:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .all_apps_of_the_suite
                                    .title,
                            description:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .all_apps_of_the_suite
                                    .description,
                            icon: CupertinoIcons.square_grid_2x2,
                          ),
                          _buildAdvantageRow(
                            title:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .end_to_end_encrypted
                                    .title,
                            description:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .end_to_end_encrypted
                                    .description,
                            icon: CupertinoIcons.lock,
                          ),
                          _buildAdvantageRow(
                            title:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .unlimited_tasks
                                    .title,
                            description:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .unlimited_tasks
                                    .description,
                            icon: CupertinoIcons.checkmark_square,
                          ),
                          _buildAdvantageRow(
                            title:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .unlimited_tags
                                    .title,
                            description:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .unlimited_tags
                                    .description,
                            icon: CupertinoIcons.tags,
                          ),
                          _buildAdvantageRow(
                            title:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .unlimited_habits
                                    .title,
                            description:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .unlimited_habits
                                    .description,
                            icon: CupertinoIcons.repeat,
                          ),
                          _buildAdvantageRow(
                            title:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .sync_across_devices
                                    .title,
                            description:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .sync_across_devices
                                    .description,
                            icon: CupertinoIcons.cloud,
                          ),
                          _buildAdvantageRow(
                            title:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .community_backed
                                    .title,
                            description:
                                context
                                    .t
                                    .paywall
                                    .advantages
                                    .community_backed
                                    .description,
                            icon: CupertinoIcons.person_3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: $constants.insets.md),
            const Divider(),
            SizedBox(height: $constants.insets.xs),
          ],
        ),
      ),
    );
  }

  _buildAdvantageRow({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Icon(icon, color: getTheme(context).primary),
        ),
        SizedBox(width: $constants.insets.md),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: getTextTheme(
                context,
              ).bodyLarge?.copyWith(fontWeight: FontWeight.bold, height: 1),
            ),
            Flexible(
              child: SizedBox(
                width: getSize(context).width * 0.6,
                child: Text(
                  description,
                  style: getTextTheme(
                    context,
                  ).bodyMedium?.copyWith(color: Colors.grey.shade600),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _startCheckingForPurchase(BuildContext context) {
    setState(() {
      int loopCount = 0;
      _checkPurchaseTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        loopCount++;
        final authState = context.read<AuthBloc>().state;
        final isUserHaveActiveSubscription = UserService.isSubscriptionActive(
          widget.globalApiClient,
          authState.user,
        );
        if (isUserHaveActiveSubscription) {
          setState(() {
            _purchaseSuccess = true;
            _purchaseFailed = false;
          });
          // Show success message and close the paywall after a delay
          Timer(const Duration(seconds: 5), () {
            if (!context.mounted) return;
            Navigator.of(context).pop();
          });
          _checkPurchaseTimer?.cancel();
        } else if (loopCount >= 30) {
          setState(() {
            _checkPurchaseTimer?.cancel();
            _checkPurchaseTimer = null;
            _purchaseSuccess = false;
            _purchaseFailed = true;
          });
          _checkPurchaseTimer?.cancel();
        } else {
          if (authState.runtimeType != Loading) {
            context.read<AuthBloc>().add(const RefreshUser());
          }
        }
      });
    });
  }

  // when _purchaseSuccess is true
  Widget _buildPurchaseSuccess(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/credit_card_success.json',
              width:
                  isDesktop(context)
                      ? getSize(context).width * 0.3
                      : getSize(context).width,
            ),
            SizedBox(height: $constants.insets.sm),
            Text(
              context.t.paywall.success,
              style: getTextTheme(
                context,
              ).headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: $constants.insets.sm),
            const Spacer(),
            PrimaryButtonSquare(
              text: context.t.actions.close,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: $constants.insets.lg),
          ],
        ),
      ),
    );
  }

  // when _purchaseFailed is true, display the error corresponding to _errorId
  Widget _buildPurchaseFailed(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            SizedBox(height: getSize(context).height * 0.1),
            SizedBox(
              width: getSize(context).width * 0.8,
              height: getSize(context).height * 0.3,
              child: Transform.scale(
                scale: 2,
                child: Lottie.asset(
                  'assets/animations/failed.json',
                  width:
                      isDesktop(context)
                          ? getSize(context).width * 0.3
                          : getSize(context).width,
                ),
              ),
            ),
            SizedBox(height: $constants.insets.lg),
            Text(
              context.t.paywall.validation_failed,
              style: getTextTheme(
                context,
              ).headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: $constants.insets.sm),
            Text(
              context.t.paywall.validation_failed_description,
              textAlign: TextAlign.center,
              style: getTextTheme(
                context,
              ).bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
            SizedBox(height: $constants.insets.sm),
            const Spacer(),
            PrimaryButtonSquare(
              text: context.t.actions.close,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: $constants.insets.lg),
          ],
        ),
      ),
    );
  }

  // when _isMakingPurchase is true, display a "making purchase" loading widget
  // when _checkPurchaseTimer is running, display a "checking purchase" loading widget
  Widget _buildPurchaseLoading(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            SizedBox(height: getSize(context).height * 0.1),
            Lottie.asset(
              'assets/animations/apple_pay.json',
              width:
                  isDesktop(context)
                      ? getSize(context).width * 0.3
                      : getSize(context).width,
            ),
            SizedBox(height: $constants.insets.lg),
            Text(
              context.t.paywall.payment_in_progress,
              style: getTextTheme(context).headlineSmall,
            ),
            SizedBox(height: $constants.insets.sm),
            Text(
              context.t.paywall.payment_in_progress_description,
              textAlign: TextAlign.center,
              style: getTextTheme(
                context,
              ).bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
