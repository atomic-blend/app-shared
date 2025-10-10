import 'package:ab_shared/entities/user/user.entity.dart';
import 'package:ab_shared/pages/paywall/paywall.dart';
import 'package:ab_shared/services/user.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaywallUtils {
  static resetPaywall() {
    final getIt = GetIt.instance;
    getIt<SharedPreferences>().remove("paywall_displayed");
  }

  static showPaywall(BuildContext context, {UserEntity? user}) async {
    final getIt = GetIt.instance;
    final globalApiClient = getIt<ApiClient>();
    final prefs = getIt<SharedPreferences>();
    if (globalApiClient.getSelfHostedRestApiUrl() != null) {
      return;
    }
    final paywallDisplayed = prefs.getBool("paywall_displayed") ?? false;
    if (paywallDisplayed) {
      if (kDebugMode) {
        print("Paywall already displayed, skipping...");
      }
      return;
    }

    await prefs.setBool("paywall_displayed", true);

    if (user != null) {
      if (UserService.isSubscriptionActive(globalApiClient, user)) {
        return;
      }
    }

    if (!context.mounted) {
      if (kDebugMode) {
        print("Context is not mounted, skipping paywall display...");
      }
      return;
    }
    if (isDesktop(context)) {
      await showDialog(
        context: context,
        builder:
            (context) => Dialog(
              child: SizedBox(
                width: getSize(context).width * 0.8,
                height: getSize(context).height * 0.85,
                child: Paywall(),
              ),
            ),
      );
    } else {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder:
            (context) => SizedBox(
              width: getSize(context).width,
              height: getSize(context).height * 0.85,
              child: Paywall(),
            ),
      );
    }

    await prefs.setBool("paywall_displayed", false);
  }
}
