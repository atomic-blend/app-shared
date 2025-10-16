import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class DesktopOnlyStep extends StatelessWidget {
  const DesktopOnlyStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: $constants.insets.sm),
          Text(context.t.auth.register.desktop_only_step_description),
          SizedBox(height: $constants.insets.md),
          PrimaryButtonSquare(
            onPressed: () {
              UrlLauncher.launchUrl(
                "https://mail.atomic-blend.com/#/auth/register",
              );
            },
            text: context.t.auth.register.go_on_desktop,
          ),
        ],
      ),
    );
  }
}
