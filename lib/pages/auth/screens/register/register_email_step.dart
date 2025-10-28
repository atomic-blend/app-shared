import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/components/modals/edit_self_hosted_url_modal.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';

class RegisterEmailStep extends StatefulWidget {
  final String? username;
  final String? domain;
  final String? password;
  final String? passwordConfirmation;
  final Function(String email, String password) onSuccess;
  const RegisterEmailStep({
    super.key,
    required this.onSuccess,
    this.username,
    this.domain,
    this.password,
    this.passwordConfirmation,
  });

  @override
  State<RegisterEmailStep> createState() => _RegisterEmailStepState();
}

class _RegisterEmailStepState extends State<RegisterEmailStep>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  String? errorMessage;
  String? domain;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(LoadConfig());
    _usernameController.text = widget.username ?? '';
    domain = widget.domain;
    _passwordController.text = widget.password ?? '';
    _passwordConfirmationController.text = widget.passwordConfirmation ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Form(
          key: _formKey,
          child: Container(
            constraints: BoxConstraints(
              minWidth: isDesktop(context) ? 500 : 200,
            ),
            width:
                isDesktop(context)
                    ? getSize(context).width * 0.2
                    : getSize(context).width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!kIsWeb) ...[
                    SizedBox(height: $constants.insets.xs),
                    EditSelfHostedUrlButton(),
                  ],
                  SizedBox(height: $constants.insets.sm),
                  if (authState.appConfig?.paymentEnabled == true) ...[
                    ElevatedContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                        vertical: $constants.insets.sm,
                      ),
                      disableShadow: true,
                      color: CupertinoColors.activeBlue.withValues(alpha: 0.2),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.creditcard_fill,
                            color: CupertinoColors.activeBlue.darken(10),
                            size: 24,
                          ),
                          SizedBox(width: $constants.insets.sm),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.t.auth.register.payment_enabled.title,
                                  style: getTextTheme(
                                    context,
                                  ).bodyLarge!.copyWith(
                                    color: CupertinoColors.activeBlue.darken(
                                      10,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  context
                                      .t
                                      .auth
                                      .register
                                      .payment_enabled
                                      .description,
                                  style: getTextTheme(
                                    context,
                                  ).bodyMedium!.copyWith(
                                    color: CupertinoColors.activeBlue.darken(
                                      10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: $constants.insets.xs),
                    ElevatedContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                        vertical: $constants.insets.sm,
                      ),
                      disableShadow: true,
                      color: CupertinoColors.activeGreen.withValues(alpha: 0.2),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.percent,
                            color: CupertinoColors.activeGreen.darken(10),
                            size: 24,
                          ),
                          SizedBox(width: $constants.insets.sm),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Beta Offer - 50% off",
                                  style: getTextTheme(
                                    context,
                                  ).bodyMedium!.copyWith(
                                    color: CupertinoColors.activeGreen.darken(
                                      10,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  SizedBox(height: $constants.insets.sm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:
                            isDesktop(context)
                                ? 240
                                : getSize(context).width * 0.4,
                        child: AppTextFormField(
                          controller: _usernameController,
                          labelText: context.t.auth.login.username,
                          hintText: context.t.auth.register.username_hint,
                          labelStyle: getTextTheme(
                            context,
                          ).bodySmall!.copyWith(color: Colors.grey.shade600),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.t.auth.register.username_required;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: $constants.insets.xs),
                      Expanded(
                        child: CustomPopup(
                          barrierColor: Colors.transparent,
                          content: SizedBox(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Please select a domain",
                                  style: getTextTheme(context).headlineSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: $constants.insets.sm),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      if (authState.appConfig != null)
                                        ...authState.appConfig!.domains.map(
                                          (e) => Padding(
                                            padding: EdgeInsets.only(
                                              bottom: $constants.insets.sm,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  domain = e;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      getTheme(
                                                        context,
                                                      ).surfaceContainer,

                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        $constants.insets.sm,
                                                      ),
                                                ),
                                                width: double.infinity,
                                                height: 45,
                                                child: Center(child: Text(e)),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.t.auth.register.domain,
                                style: getTextTheme(context).bodySmall!
                                    .copyWith(color: Colors.grey.shade600),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: $constants.insets.sm,
                                ),
                                decoration: BoxDecoration(
                                  color: getTheme(context).surfaceContainer,

                                  borderRadius: BorderRadius.circular(
                                    $constants.insets.sm,
                                  ),
                                ),
                                height: 40,
                                width: getSize(context).width * 0.45,
                                child: Row(
                                  children: [
                                    if (domain == null || domain!.isEmpty)
                                      Row(
                                        children: [
                                          Text("@"),
                                          SizedBox(width: $constants.insets.md),
                                          SizedBox(
                                            width: 80,
                                            child: AutoSizeText(
                                              maxLines: 1,

                                              "Please select a domain",
                                              style: getTextTheme(
                                                context,
                                              ).bodySmall!.copyWith(
                                                color: Colors.grey[700],
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      Text("@${domain!}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (authState.appConfig == null) ...[
                    SizedBox(height: $constants.insets.xs),
                    Text(
                      "Cannot get the app config from the server",
                      style: getTextTheme(
                        context,
                      ).bodySmall!.copyWith(color: Colors.red),
                    ),
                    Text(
                      "Please try again later",
                      style: getTextTheme(
                        context,
                      ).bodySmall!.copyWith(color: Colors.red),
                    ),
                  ],
                  SizedBox(height: $constants.insets.xs),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: $constants.insets.xs),
                  SizedBox(
                    width: getSize(context).width * 0.9,
                    child: AppTextFormField(
                      controller: _passwordController,
                      hintText: context.t.auth.register.password_hint,
                      labelText: context.t.auth.register.password,
                      labelStyle: getTextTheme(
                        context,
                      ).bodySmall!.copyWith(color: Colors.grey.shade600),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.t.auth.register.password_required;
                        } else if (value.length < 8) {
                          return context.t.auth.register.password_invalid;
                        }
                        return null;
                      },
                      onChange: () {
                        setState(
                          () {},
                        ); // Trigger rebuild to update password conditions
                      },
                    ),
                  ),
                  SizedBox(height: $constants.insets.xs),
                  // Password validation checklist
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.sm,
                    ),
                    width: getSize(context).width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPasswordCondition(
                          context,
                          "8 characters minimum",
                          _passwordController.text.length >= 8,
                        ),
                        SizedBox(height: $constants.insets.xs),
                        _buildPasswordCondition(
                          context,
                          "1 capital letter",
                          _passwordController.text.contains(RegExp(r'[A-Z]')),
                        ),
                        SizedBox(height: $constants.insets.xs),
                        _buildPasswordCondition(
                          context,
                          "1 number",
                          _passwordController.text.contains(RegExp(r'[0-9]')),
                        ),
                        SizedBox(height: $constants.insets.xs),
                        _buildPasswordCondition(
                          context,
                          "1 symbol",
                          _passwordController.text.contains(
                            RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: $constants.insets.xs),
                  SizedBox(
                    width: getSize(context).width * 0.9,
                    child: AppTextFormField(
                      controller: _passwordConfirmationController,
                      hintText: context.t.auth.register.confirmation_hint,
                      labelText: context.t.auth.register.confirmation_hint,
                      labelStyle: getTextTheme(
                        context,
                      ).bodySmall!.copyWith(color: Colors.grey.shade600),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.t.auth.register.password_mismatch;
                        } else if (value != _passwordController.text) {
                          return context.t.auth.register.password_mismatch;
                        }
                        return null;
                      },
                    ),
                  ),
                  if (errorMessage != null &&
                      context.t.errors[errorMessage] != null) ...[
                    SizedBox(height: $constants.insets.xs),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                      ),
                      child: SizedBox(
                        width: getSize(context).width * 0.9,
                        child: Text(
                          context.t.errors[errorMessage]!,
                          style: getTextTheme(
                            context,
                          ).labelSmall!.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(height: $constants.insets.sm),
                  ],
                  if (errorMessage == null)
                    SizedBox(height: $constants.insets.lg),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PrimaryButtonSquare(
                        text: context.t.auth.login_or_register.next,
                        backgroundColor: getTheme(context).primary,
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          if (domain == null || domain!.isEmpty) {
                            setState(() {
                              errorMessage = "domain_required";
                            });
                            return;
                          }
                          if (!context.mounted) return;
                          widget.onSuccess(
                            "${_usernameController.text}@${domain!}",
                            _passwordController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPasswordCondition(
    BuildContext context,
    String text,
    bool isValid,
  ) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isValid ? Colors.green : Colors.grey,
          size: 16,
        ),
        SizedBox(width: $constants.insets.xs),
        Text(
          text,
          style: getTextTheme(context).bodySmall!.copyWith(
            color: isValid ? Colors.green : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
