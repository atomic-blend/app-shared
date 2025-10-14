import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:ab_shared/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordIntro extends StatefulWidget {
  final String? email;
  final Function(String email) onSuccess;
  const ResetPasswordIntro({super.key, required this.onSuccess, this.email});

  @override
  State<ResetPasswordIntro> createState() => _ResetPasswordIntroState();
}

class _ResetPasswordIntroState extends State<ResetPasswordIntro> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState authState) {
        if (authState is StartResetPasswordSuccess) {
          widget.onSuccess(_emailController.text);
        }
        if (authState is StartResetPasswordError) {
          if (authState.message == "no_backup_email") {
            ToastHelper.showError(
              context: context,
              title: context.t.auth.reset_password.no_backup_email,
              description:
                  context.t.auth.reset_password.no_backup_email_description,
            );
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: $constants.insets.md),
              Text(
                context.t.auth.reset_password.title,
                style: getTextTheme(
                  context,
                ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                context.t.auth.reset_password.subtitle,
                style: getTextTheme(
                  context,
                ).bodySmall!.copyWith(color: Colors.grey),
              ),
              SizedBox(height: $constants.insets.sm),
              Text(context.t.auth.reset_password.warning),
              SizedBox(height: $constants.insets.sm),
              Text(
                context.t.auth.reset_password.no_mnemonic_data_loss,
                style: getTextTheme(context).bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: getTheme(context).error,
                ),
              ),
              SizedBox(height: $constants.insets.sm),
              AppTextFormField(
                controller: _emailController,
                labelText: context.t.auth.reset_password.email,
                labelDescription:
                    context.t.auth.reset_password.email_description,
                hintText: context.t.auth.reset_password.email_hint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.t.auth.reset_password.email_required;
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
                  if (!context.mounted) {
                    return;
                  }
                  context.read<AuthBloc>().add(
                    StartResetPassword(_emailController.text),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
