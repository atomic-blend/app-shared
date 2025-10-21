import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:ab_shared/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaitingListStartStep extends StatefulWidget {
  final Function(bool hasCode) onHasCode;
  final VoidCallback onSuccess;
  const WaitingListStartStep({
    super.key,
    required this.onHasCode,
    required this.onSuccess,
  });

  @override
  State<WaitingListStartStep> createState() => _WaitingListStartStepState();
}

class _WaitingListStartStepState extends State<WaitingListStartStep> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, AuthState authState) {
        if (authState is JoinWaitingListSuccess) {
          widget.onSuccess();
        }
        if (authState is JoinWaitingListError) {
          ToastHelper.showError(
            context: context,
            title:
                context.t.errors[authState.message] ??
                context.t.errors["unknown_error"]!,
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: $constants.insets.md),
                  Text(
                    context.t.waiting_list.title,
                    style: getTextTheme(
                      context,
                    ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    context.t.waiting_list.description,
                    style: getTextTheme(context).bodyMedium,
                  ),
                  SizedBox(height: $constants.insets.sm),
                  AppTextFormField(
                    controller: _emailController,
                    labelText: context.t.waiting_list.email,
                    hintText: context.t.waiting_list.email_hint,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return context.t.waiting_list.email_required;
                      }
                      if (value != null && !value.contains("@")) {
                        return context.t.waiting_list.invalid_email;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: $constants.insets.sm),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        widget.onHasCode(true);
                      },
                      child: Text(
                        context.t.waiting_list.i_have_a_code,
                        style: getTextTheme(
                          context,
                        ).bodySmall!.copyWith(color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                  PrimaryButtonSquare(
                    leading:
                        authState is JoinWaitingListLoading
                            ? CircularProgressIndicator(strokeWidth: 2)
                            : null,
                    text: context.t.waiting_list.join_waiting_list,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          JoinWaitingList(_emailController.text),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
