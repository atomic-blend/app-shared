import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class ResetPasswordNewPassword extends StatefulWidget {
  final String? password;
  final Function(String password) onSuccess;
  const ResetPasswordNewPassword({
    super.key,
    required this.onSuccess,
    this.password,
  });

  @override
  State<ResetPasswordNewPassword> createState() =>
      _ResetPasswordNewPasswordState();
}

class _ResetPasswordNewPasswordState extends State<ResetPasswordNewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordController.text = widget.password ?? '';
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
              context.t.auth.reset_password.select_your_new_password,
              style: getTextTheme(
                context,
              ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              context
                  .t
                  .auth
                  .reset_password
                  .select_your_new_password_description,
              style: getTextTheme(
                context,
              ).bodySmall!.copyWith(color: Colors.grey),
            ),
            SizedBox(height: $constants.insets.sm),
            AppTextFormField(
              controller: _passwordController,
              labelText: context.t.auth.reset_password.new_password,
              labelDescription:
                  context.t.auth.reset_password.new_password_description,
              hintText: context.t.auth.reset_password.new_password_hint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.t.auth.reset_password.new_password_required;
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: $constants.insets.sm),
            AppTextFormField(
              controller: _confirmationController,
              labelText: context.t.auth.reset_password.confirm_new_password,
              labelDescription:
                  context
                      .t
                      .auth
                      .reset_password
                      .confirm_new_password_description,
              hintText: context.t.auth.reset_password.new_password_hint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context
                      .t
                      .auth
                      .reset_password
                      .confirm_new_password_required;
                }
                if (value != _passwordController.text) {
                  return context.t.auth.reset_password.password_mismatch;
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: $constants.insets.md),
            PrimaryButtonSquare(
              text: context.t.actions.next,
              backgroundColor: getTheme(context).primary,
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                widget.onSuccess(_passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
