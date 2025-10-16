import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class ResetPasswordCode extends StatefulWidget {
  final String? emailCode;
  final Function(String emailCode) onSuccess;
  const ResetPasswordCode({super.key, required this.onSuccess, this.emailCode});

  @override
  State<ResetPasswordCode> createState() => _ResetPasswordCodeState();
}

class _ResetPasswordCodeState extends State<ResetPasswordCode> {
  final _emailCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailCodeController.text = widget.emailCode ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: $constants.insets.md),
            Text(
              context.t.auth.reset_password.enter_the_confirmation_code,
              style: getTextTheme(
                context,
              ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              context.t.auth.reset_password.confirmation_code_sent,
              style: getTextTheme(
                context,
              ).bodySmall!.copyWith(color: Colors.grey),
            ),
            SizedBox(height: $constants.insets.sm),
            Text(
              context.t.auth.reset_password.confirmation_code_sent_description,
              style: getTextTheme(
                context,
              ).bodySmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: $constants.insets.sm),
            AppTextFormField(
              controller: _emailCodeController,
              labelText: context.t.auth.reset_password.confirmation_code,
              labelDescription:
                  context.t.auth.reset_password.confirmation_code_description,
              hintText: context.t.auth.reset_password.confirmation_code_hint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context
                      .t
                      .auth
                      .reset_password
                      .confirmation_code_required;
                }
                return null;
              },
            ),
            SizedBox(height: $constants.insets.md),
            PrimaryButtonSquare(
              text: context.t.actions.next,
              backgroundColor: getTheme(context).primary,
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                widget.onSuccess(_emailCodeController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
