import 'package:ab_shared/components/buttons/primary_button_round.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EditSelfHostedUrlModal extends StatefulWidget {
  final getIt = GetIt.instance;
  late final ApiClient? globalApiClient;
  EditSelfHostedUrlModal({super.key}) {
    globalApiClient = getIt<ApiClient>();
  }

  @override
  State<EditSelfHostedUrlModal> createState() => _EditSelfHostedUrlModalState();
}

class _EditSelfHostedUrlModalState extends State<EditSelfHostedUrlModal> {
  final _selfHostedUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _selfHostedUrlController.text =
        widget.globalApiClient?.getSelfHostedRestApiUrl() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($constants.insets.md),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.settings.app_settings.selfHostedUrl.title,
              style: getTextTheme(
                context,
              ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: $constants.insets.xs),
            Text(context.t.settings.app_settings.selfHostedUrl.description),
            SizedBox(height: $constants.insets.sm),
            AppTextFormField(
              controller: _selfHostedUrlController,
              hintText:
                  context.t.settings.app_settings.selfHostedUrl.placeholder,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
                if (!Uri.parse(value).isAbsolute) {
                  return context.t.validation.invalid_url;
                }
                return null;
              },
              onDelete: () {
                _selfHostedUrlController.clear();
              },
            ),
            SizedBox(height: $constants.insets.md),
            Row(
              children: [
                Expanded(
                  child: PrimaryButtonRound(
                    width: double.infinity,
                    border: Border.all(color: getTheme(context).primary),
                    textColor: getTheme(context).primary,
                    backgroundColor: getTheme(context).surface,
                    text: context.t.actions.cancel,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: $constants.insets.sm),
                Expanded(
                  child: PrimaryButtonRound(
                    width: double.infinity,
                    text: context.t.actions.save,
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      bool? result = await widget.globalApiClient
                          ?.setSelfHostedRestApiUrl(
                            _selfHostedUrlController.text,
                          );
                      if (result == true) {
                        if (!context.mounted) return;
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EditSelfHostedUrlButton extends StatelessWidget {
  final getIt = GetIt.instance;
  late final ApiClient? globalApiClient;
  late final EnvModel? env;
  EditSelfHostedUrlButton({super.key}) {
    globalApiClient = getIt<ApiClient>();
    env = getIt<EnvModel>();
  }

  @override
  Widget build(BuildContext context) {
    final selfHostedUrl = globalApiClient?.getSelfHostedRestApiUrl();
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (context) => Dialog(
                child: SizedBox(
                  width:
                      isDesktop(context)
                          ? getSize(context).width * 0.25
                          : getSize(context).width * 0.9,
                  child: EditSelfHostedUrlModal(),
                ),
              ),
        );
      },
      child: Text.rich(
        TextSpan(
          text: context.t.auth.login_or_register.connecting_to,
          children: [
            TextSpan(
              text:
                  selfHostedUrl != null && selfHostedUrl != env?.restApiUrl
                      ? _extractDomainFromUrl(selfHostedUrl)
                      : context.t.app_name_saas,
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
        style: getTextTheme(
          context,
        ).bodyMedium!.copyWith(color: Colors.grey.shade500),
      ),
    );
  }

  _extractDomainFromUrl(String url) {
    return Uri.parse(url).host;
  }
}
