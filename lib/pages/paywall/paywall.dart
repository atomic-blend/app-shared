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
import 'package:ab_shared/utils/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

part 'paywall.g.dart';

@TypedGoRoute<PaywallRoute>(path: "/paywall", name: "paywall")
class PaywallRoute extends GoRouteData with _$PaywallRoute {
  const PaywallRoute({this.success, this.cancelled});

  final String? success;
  final String? cancelled;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Paywall(success: success == 'true', cancelled: cancelled == 'true');
  }
}

class Paywall extends StatefulWidget {
  final getIt = GetIt.instance;
  late final RevenueCatService revenueCatService;
  late final ApiClient globalApiClient;

  final bool success;
  final bool cancelled;
  Paywall({super.key, this.success = false, this.cancelled = false}) {
    globalApiClient = getIt<ApiClient>();
  }

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  final getIt = GetIt.instance;
  bool? _isMakingPurchase;
  Timer? _checkPurchaseTimer;

  @override
  void initState() {
    super.initState();
    if (widget.success == true) {
      _startCheckingForPurchase(context);
    }
  }

  @override
  void dispose() {
    _checkPurchaseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is CheckoutLoaded) {
          //TODO: open session url
          print('Open checkout url: ${authState.sessionUrl}');
          UrlLauncher.launchUrl(
            authState.sessionUrl,
            webOnlyWindowName: '_self',
          );
        }

        if (authState.user != null &&
            UserService.isSubscriptionActive(
              widget.globalApiClient,
              authState.user,
            )) {
          // User has an active subscription, redirect to home
          WidgetsBinding.instance.addPostFrameCallback((_) {
            getIt<GoRouter>().go('/');
          });
          return Container();
        }

        // Start checking for purchase after returning from Stripe
        if (widget.success == true && _checkPurchaseTimer == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _startCheckingForPurchase(context);
          });
        }

        if (widget.cancelled == true) {
          return _buildPurchaseFailed(context);
        }

        if (_isMakingPurchase == true || _checkPurchaseTimer != null) {
          return _buildPurchaseLoading(context);
        }
        return Scaffold(
          backgroundColor: getTheme(context).surface,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: getSize(context).height * 0.15),
              Center(
                child: ElevatedContainer(
                  constraints: BoxConstraints(
                    minWidth: isDesktop(context) ? 500 : 200,
                  ),
                  color: getTheme(context).surface,
                  width:
                      isDesktop(context)
                          ? getSize(context).width * 0.2
                          : getSize(context).width * 0.9,
                  height: getSize(context).height * 0.7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                      vertical: $constants.insets.md,
                    ),
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
                            style: getTextTheme(context).headlineLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
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
                          SizedBox(height: $constants.insets.md),
                          const Divider(),
                          SizedBox(height: $constants.insets.xs),
                          PrimaryButtonSquare(
                            text: "Start 7-day Free Trial",
                            onPressed: () async {
                              context.read<AuthBloc>().add(const Checkout());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
    int loopCount = 0;
    _checkPurchaseTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      loopCount++;
      final authState = context.read<AuthBloc>().state;
      final isUserHaveActiveSubscription = UserService.isSubscriptionActive(
        widget.globalApiClient,
        authState.user,
      );
      if (isUserHaveActiveSubscription && authState.runtimeType != Loading) {
        // Subscription is active, redirect to home
        _checkPurchaseTimer?.cancel();
        _checkPurchaseTimer = null;
        if (!context.mounted) return;
        getIt<GoRouter>().go('/');
      } else if (loopCount >= 60) {
        // Timeout after 60 seconds
        _checkPurchaseTimer?.cancel();
        _checkPurchaseTimer = null;
        setState(() {});
        getIt<GoRouter>().go('/paywall?cancelled=true');
      } else {
        // Keep checking by refreshing user data
        if (authState.runtimeType != Loading) {
          context.read<AuthBloc>().add(const RefreshUser());
        }
      }
    });
  }

  // when _purchaseFailed is true, display the error corresponding to _errorId
  Widget _buildPurchaseFailed(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context).surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: getSize(context).height * 0.15),
          Center(
            child: ElevatedContainer(
              constraints: BoxConstraints(
                minWidth: isDesktop(context) ? 500 : 200,
              ),
              color: getTheme(context).surface,
              width:
                  isDesktop(context)
                      ? getSize(context).width * 0.2
                      : getSize(context).width * 0.9,
              height: getSize(context).height * 0.7,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.sm,
                  vertical: $constants.insets.md,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  // when _isMakingPurchase is true, display a "making purchase" loading widget
  // when _checkPurchaseTimer is running, display a "checking purchase" loading widget
  Widget _buildPurchaseLoading(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context).surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: getSize(context).height * 0.15),
          Center(
            child: ElevatedContainer(
              constraints: BoxConstraints(
                minWidth: isDesktop(context) ? 500 : 200,
              ),
              color: getTheme(context).surface,
              width:
                  isDesktop(context)
                      ? getSize(context).width * 0.2
                      : getSize(context).width * 0.9,
              height: getSize(context).height * 0.7,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.sm,
                  vertical: $constants.insets.md,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
