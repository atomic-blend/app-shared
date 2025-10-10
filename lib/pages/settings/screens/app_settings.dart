import 'package:ab_shared/components/buttons/icon_text_button.dart';
import 'package:ab_shared/components/modals/edit_self_hosted_url_modal.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends StatefulWidget {
  final SharedPreferences? prefs;
  final ApiClient? globalApiClient;
  const AppSettings({super.key, this.prefs, this.globalApiClient});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  String? selfHostedUrl;

  @override
  void initState() {
    getSelfHostedUrl();
    super.initState();
  }

  getSelfHostedUrl() {
    setState(() {
      selfHostedUrl = widget.prefs?.getString("self_hosted_rest_api_url");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          spacing: $constants.insets.xs,
          children: [
            const Icon(LineAwesome.mobile_solid),
            Text(context.t.settings.app_settings.title,
                style: getTextTheme(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm, vertical: $constants.insets.sm),
        child: Column(
          children: [
            IconTextButton(
              icon: LineAwesome.link_solid,
              text: context.t.settings.app_settings.selfHostedUrl.title,
              data: selfHostedUrl == "" || selfHostedUrl == null
                  ? context.t.settings.app_settings.selfHostedUrl.not_set
                  : selfHostedUrl,
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) => EditSelfHostedUrlModal(
                          selfHostedUrl:
                              widget.prefs?.getString("self_hosted_rest_api_url"),
                        ));
                getSelfHostedUrl();
              },
            )
          ],
        ),
      ),
    );
  }
}
