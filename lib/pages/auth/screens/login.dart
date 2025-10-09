import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/reset_password.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login.g.dart';

class LoginParams {
  final VoidCallback? onAuthSuccess;
  final EncryptionService? encryptionService;
  final ApiClient? globalApiClient;
  final SharedPreferences? prefs;
  final EnvModel? env;

  const LoginParams({
    this.onAuthSuccess,
    this.encryptionService,
    this.globalApiClient,
    this.prefs,
    this.env,
  });
}

@TypedGoRoute<LoginRoute>(path: "/auth/login", name: "login")
class LoginRoute extends GoRouteData with _$LoginRoute {
  final LoginParams? $extra;
  LoginRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(encryptionService: $extra?.encryptionService);
  }
}

class LoginScreen extends StatefulWidget {
  final EncryptionService? encryptionService;
  const LoginScreen({super.key, this.encryptionService});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
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
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            setState(() {
              errorMessage = state.message;
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isDesktop(context)) Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    minWidth: isDesktop(context) ? 500 : 200,
                  ),
                  width:
                      isDesktop(context)
                          ? getSize(context).width * 0.2
                          : getSize(context).width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.md,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: $constants.insets.lg),
                          SizedBox(
                            height: 350,
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
                                  child: ElevatedContainer(
                                    width: 120,
                                    height: 120,
                                    blurRadius: 32,
                                    borderRadius: $constants.corners.xl,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        $constants.corners.xl,
                                      ),
                                      child: Image.asset(
                                        "assets/images/appicon.png",
                                      ),
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
                                    style: getTextTheme(context).displaySmall!
                                        .copyWith(fontWeight: FontWeight.bold),
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
                                    context
                                        .t
                                        .auth
                                        .not_logged_in
                                        .log_in_to_your_account,
                                    textAlign: TextAlign.center,
                                    style: getTextTheme(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: $constants.insets.sm),
                          SizedBox(
                            height: 280,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: $constants.insets.md),
                                SizedBox(
                                  width: getSize(context).width * 0.9,
                                  child: Animate(
                                    controller: _animationController,
                                    effects: [
                                      FadeEffect(
                                        duration: _animationDuration,
                                        delay: const Duration(
                                          milliseconds: 300,
                                        ),
                                      ),
                                    ],
                                    onPlay:
                                        (controller) => controller.forward(),
                                    child: AppTextFormField(
                                      controller: _emailController,
                                      hintText: context.t.auth.login.email,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                                SizedBox(height: $constants.insets.xs),
                                SizedBox(
                                  width: getSize(context).width * 0.9,
                                  child: Animate(
                                    controller: _animationController,
                                    effects: [
                                      FadeEffect(
                                        duration: _animationDuration,
                                        delay: const Duration(
                                          milliseconds: 300,
                                        ),
                                      ),
                                    ],
                                    onPlay:
                                        (controller) => controller.forward(),
                                    child: AppTextFormField(
                                      controller: _passwordController,
                                      hintText:
                                          context.t.auth.register.password_hint,
                                      obscureText: true,
                                    ),
                                  ),
                                ),
                                if (errorMessage != null &&
                                    context.t.errors[errorMessage] != null) ...[
                                  SizedBox(height: $constants.insets.xs),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: $constants.insets.lg,
                                    ),
                                    child: Animate(
                                      controller: _animationController,
                                      effects: [
                                        FadeEffect(
                                          duration: _animationDuration,
                                          delay: const Duration(
                                            milliseconds: 300,
                                          ),
                                        ),
                                      ],
                                      onPlay:
                                          (controller) => controller.forward(),
                                      child: SizedBox(
                                        width: getSize(context).width * 0.9,
                                        child: Text(
                                          context.t.errors[errorMessage]!,
                                          style: getTextTheme(context)
                                              .labelSmall!
                                              .copyWith(color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: $constants.insets.sm),
                                ],
                                if (errorMessage == null)
                                  SizedBox(height: $constants.insets.xl),
                                Animate(
                                  controller: _animationController,
                                  effects: [
                                    FadeEffect(
                                      duration: _animationDuration,
                                      delay: const Duration(milliseconds: 500),
                                    ),
                                  ],
                                  onPlay: (controller) => controller.forward(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      PrimaryButtonSquare(
                                        text: context.t.auth.login.login,
                                        backgroundColor:
                                            getTheme(context).primary,
                                        onPressed: () async {
                                          if (_emailController
                                                  .text
                                                  .isNotEmpty &&
                                              _passwordController
                                                  .text
                                                  .isNotEmpty) {
                                            if (!context.mounted) return;
                                            context.read<AuthBloc>().add(
                                              LoginEvent(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text,
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
                                                    email:
                                                        _emailController.text,
                                                    encryptionService:
                                                        widget
                                                            .encryptionService,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          context.t.auth.reset_password.title,
                                          style: getTextTheme(context)
                                              .bodyMedium!
                                              .copyWith(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Animate(
                            controller: _animationController,
                            effects: [
                              FadeEffect(
                                duration: _animationDuration,
                                delay: const Duration(milliseconds: 300),
                              ),
                            ],
                            onPlay: (controller) => controller.forward(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(height: $constants.insets.sm),
                                ),
                                SizedBox(width: $constants.insets.sm),
                                Text("or"),
                                SizedBox(width: $constants.insets.sm),
                                Expanded(
                                  child: Divider(height: $constants.insets.sm),
                                ),
                              ],
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
                            child: Center(
                              child: PrimaryButtonSquare(
                                text: context.t.auth.login_or_register.register,
                                backgroundColor: getTheme(context).primary,
                                outlined: true,
                                onPressed: () {
                                  context.go("/auth/register");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isDesktop(context)) Spacer(),
          ],
        ),
      ),
    );
  }
}
