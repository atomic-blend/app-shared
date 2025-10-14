import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/widgets.dart';

class BackupEmailStep extends StatefulWidget {
  final Function(String backupEmail) onSuccess;
  final String? nextButtonText;
  const BackupEmailStep({
    super.key,
    required this.onSuccess,
    this.nextButtonText,
  });

  @override
  State<BackupEmailStep> createState() => _BackupEmailStepState();
}

class _BackupEmailStepState extends State<BackupEmailStep> {
  final _backupEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.auth.register.setup_account_recovery,
              style: getTextTheme(
                context,
              ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            AppTextFormField(
              controller: _backupEmailController,
              hintText: context.t.auth.register.backup_email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.t.auth.register.backup_email_required;
                } else if (!value.contains('@')) {
                  return context.t.auth.register.backup_email_invalid;
                }
                return null;
              },
            ),
            SizedBox(height: $constants.insets.md),
            PrimaryButtonSquare(
              text:
                  widget.nextButtonText ??
                  context.t.auth.login_or_register.next,
              backgroundColor: getTheme(context).primary,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  widget.onSuccess(_backupEmailController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
