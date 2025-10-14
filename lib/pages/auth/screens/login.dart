import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part 'login.g.dart';

class LoginParams {
  final String? homeRouteLocation;

  const LoginParams({this.homeRouteLocation});
}

@TypedGoRoute<LoginRoute>(path: "/auth/login", name: "login")
class LoginRoute extends GoRouteData with _$LoginRoute {
  final LoginParams? $extra;
  LoginRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(homeRouteLocation: $extra?.homeRouteLocation);
  }
}

class LoginScreen extends StatefulWidget {
  final String? homeRouteLocation;
  const LoginScreen({super.key, this.homeRouteLocation});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final getIt = GetIt.instance;
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
      backgroundColor: getTheme(context).surfaceContainer,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            setState(() {
              errorMessage = state.message;
            });
          }

          if (state is LoggedIn) {
            getIt<GoRouter>().go(widget.homeRouteLocation ?? "/");
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getSize(context).height * 0.1),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  minWidth: isDesktop(context) ? 500 : 200,
                ),
                decoration: BoxDecoration(
                  color: getTheme(context).surface,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular($constants.corners.xl),
                ),
                width:
                    isDesktop(context)
                        ? getSize(context).width * 0.2
                        : getSize(context).width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.md,
                    vertical: $constants.insets.lg,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Animate(
                                controller: _animationController,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: $constants.insets.md),
                              SizedBox(
                                width: getSize(context).width * 0.9,
                                child: Animate(
                                  controller: _animationController,
                                  effects: [
                                    FadeEffect(
                                      duration: _animationDuration,
                                      delay: const Duration(milliseconds: 300),
                                    ),
                                  ],
                                  onPlay: (controller) => controller.forward(),
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
                                      delay: const Duration(milliseconds: 300),
                                    ),
                                  ],
                                  onPlay: (controller) => controller.forward(),
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
                                        style: getTextTheme(context).labelSmall!
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
                                    delay: const Duration(milliseconds: 300),
                                  ),
                                ],
                                onPlay: (controller) => controller.forward(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PrimaryButtonSquare(
                                      text: context.t.auth.login.login,
                                      backgroundColor:
                                          getTheme(context).primary,
                                      onPressed: () async {
                                        if (_emailController.text.isNotEmpty &&
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
                                        context.go("/auth/reset-password");
                                      },
                                      child: Text(
                                        context.t.auth.reset_password.title,
                                        style: getTextTheme(context).bodyMedium!
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
                            mainAxisSize: MainAxisSize.min,
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
            ),
          ],
        ),
      ),
    );
  }
}
