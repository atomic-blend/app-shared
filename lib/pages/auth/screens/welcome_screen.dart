import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/reset_password.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  final VoidCallback? nextStepCallback;
  final EncryptionService? encryptionService;
  const WelcomeScreen({
    super.key,
    this.nextStepCallback,
    this.encryptionService,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 250);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: $constants.insets.lg),
            SizedBox(
              height: getSize(context).height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Animate(
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 0),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          $constants.corners.xl,
                        ),
                        child: Image.asset("assets/images/appicon.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: $constants.insets.md),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 0),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: AutoSizeText(
                      maxLines: 1,
                      context.t.app_name,
                      textAlign: TextAlign.center,
                      style: getTextTheme(
                        context,
                      ).displaySmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: $constants.insets.md),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 300),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Text(
                      context.t.auth.not_logged_in.log_in_to_your_account,
                      textAlign: TextAlign.center,
                      style: getTextTheme(context).bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: $constants.insets.md),
                  SizedBox(
                    width: getSize(context).width * 0.9,
                    child: AppTextFormField(
                      controller: _emailController,
                      hintText: context.t.auth.login.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: $constants.insets.xs),
                  SizedBox(
                    width: getSize(context).width * 0.9,
                    child: AppTextFormField(
                      controller: _passwordController,
                      hintText: context.t.auth.register.password_hint,
                      obscureText: true,
                    ),
                  ),
                  if (errorMessage != null) ...[
                    SizedBox(height: $constants.insets.xs),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.lg,
                      ),
                      child: SizedBox(
                        width: getSize(context).width * 0.9,
                        child: Text(
                          context.t.errors[errorMessage] ??
                              context.t.errors["unknown_error"]!,
                          style: getTextTheme(
                            context,
                          ).labelSmall!.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: $constants.insets.sm),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 500),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PrimaryButtonSquare(
                            text: context.t.auth.login.login,
                            backgroundColor: getTheme(context).primary,
                            onPressed: () async {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                if (!context.mounted) return;
                                context.read<AuthBloc>().add(
                                  LoginEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              }
                            },
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => ResetPassword(
                                        email: _emailController.text,
                                        encryptionService:
                                            widget.encryptionService,
                                      ),
                                ),
                              );
                            },
                            child: Text(
                              context.t.auth.reset_password.title,
                              style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: getTheme(context).primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
