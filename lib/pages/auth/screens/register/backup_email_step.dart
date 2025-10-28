import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackupEmailStep extends StatefulWidget {
  final String? backupEmail;
  final Function(String backupEmail) onSuccess;
  final String? nextButtonText;
  final String? errorMessage;
  const BackupEmailStep({
    super.key,
    required this.onSuccess,
    this.nextButtonText,
    this.backupEmail,
    this.errorMessage,
  });

  @override
  State<BackupEmailStep> createState() => _BackupEmailStepState();
}

class _BackupEmailStepState extends State<BackupEmailStep> {
  final _backupEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _backupEmailController.text = widget.backupEmail ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
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
                  context.t.auth.register.setup_account_recovery,
                  style: getTextTheme(
                    context,
                  ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  context.t.auth.register.backup_email_description,
                  style: getTextTheme(
                    context,
                  ).bodySmall!.copyWith(color: Colors.grey),
                ),
                SizedBox(height: $constants.insets.sm),
                AppTextFormField(
                  controller: _backupEmailController,
                  hintText: context.t.auth.register.backup_email,
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        !value.contains('@')) {
                      return context.t.auth.register.backup_email_invalid;
                    }
                    return null;
                  },
                ),
                if (widget.errorMessage != null &&
                    context.t.errors[widget.errorMessage!] != null) ...[
                  SizedBox(height: $constants.insets.sm),
                  Container(
                    padding: EdgeInsets.all($constants.insets.sm),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        $constants.corners.sm,
                      ),
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      context.t.errors[widget.errorMessage!]!,
                      style: getTextTheme(
                        context,
                      ).bodySmall!.copyWith(color: Colors.red),
                    ),
                  ),
                ],
                SizedBox(height: $constants.insets.md),
                if (kIsWeb) ...[
                  Text(
                    context.t.auth.register.web_register_slow,
                    style: getTextTheme(
                      context,
                    ).bodySmall!.copyWith(color: getTheme(context).primary),
                  ),
                  SizedBox(height: $constants.insets.sm),
                ],
                PrimaryButtonSquare(
                  leading:
                      authState is AuthActionLoading
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                          : null,
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
      },
    );
  }
}
