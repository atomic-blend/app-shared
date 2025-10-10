import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/components/widgets/loading_city.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/mnemonic_key.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part 'register_email.g.dart';

class RegisterParams {
  final String? username;
  final String? domain;
  final String? homeRouteLocation;

  const RegisterParams({this.username, this.domain, this.homeRouteLocation});
}

@TypedGoRoute<RegisterRoute>(path: "/auth/register", name: "register")
class RegisterRoute extends GoRouteData with _$RegisterRoute {
  final RegisterParams? $extra;
  RegisterRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterEmail(
      username: $extra?.username,
      domain: $extra?.domain,
      homeRouteLocation: $extra?.homeRouteLocation,
    );
  }
}

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({
    super.key,
    this.username,
    this.domain,
    this.homeRouteLocation,
  });
  final String? username;
  final String? domain;
  final String? homeRouteLocation;

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail>
    with SingleTickerProviderStateMixin {
  final getIt = GetIt.instance;
  late AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 250);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;
  String? domain;

  @override
  initState() {
    _usernameController.text = widget.username ?? '';
    domain = widget.domain;
    _animationController = AnimationController(vsync: this);
    context.read<AuthBloc>().add(LoadConfig());
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          if (authState is Loading) {
            return const Center(
              child: LoadingAnimated(
                title: "Loading",
                animationPath: "assets/animations/loading-city.json",
                imageWidth: 100,
                imageHeight: 100,
              ),
            );
          }
          if (authState is AuthError) {
            errorMessage = authState.message;
          }

          if (authState is LoggedIn && authState.isRegistration == false) {
            getIt<GoRouter>().go(widget.homeRouteLocation ?? "/");
          }

          if (authState is LoggedIn && authState.isRegistration == true) {
            return MnemonicKey(
              mnemonic: authState.user!.keySet.backupPhrase!,
              onSuccess: () {
                context.read<AuthBloc>().add(MnemonicDisplayed());
              },
            );
          }

          return Row(
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
                                    onPlay:
                                        (controller) => controller.forward(),
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
                                          "assets/images/atomic_blend_logo.png",
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
                                    onPlay:
                                        (controller) => controller.forward(),
                                    child: AutoSizeText(
                                      maxLines: 1,
                                      context
                                          .t
                                          .auth
                                          .not_logged_in
                                          .register_to_atomic_blend,
                                      textAlign: TextAlign.center,
                                      style: getTextTheme(
                                        context,
                                      ).headlineLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: $constants.insets.md),
                                  Animate(
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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            isDesktop(context)
                                                ? 240
                                                : getSize(context).width * 0.4,
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
                                              (controller) =>
                                                  controller.forward(),
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
                                            child: AppTextFormField(
                                              controller: _usernameController,
                                              hintText:
                                                  context.t.auth.login.username,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: $constants.insets.xs),
                                      Expanded(
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
                                              (controller) =>
                                                  controller.forward(),
                                          child: CustomPopup(
                                            content: SizedBox(
                                              width:
                                                  getSize(context).width * 0.45,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Please select a domain",
                                                    style: getTextTheme(
                                                      context,
                                                    ).headlineSmall!.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        $constants.insets.sm,
                                                  ),
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        if (authState
                                                                .appConfig !=
                                                            null)
                                                          ...authState.appConfig!.domains.map(
                                                            (e) => Padding(
                                                              padding: EdgeInsets.only(
                                                                bottom:
                                                                    $constants
                                                                        .insets
                                                                        .sm,
                                                              ),
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    domain = e;
                                                                  });
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color:
                                                                        getTheme(
                                                                          context,
                                                                        ).surfaceContainer,

                                                                    borderRadius: BorderRadius.circular(
                                                                      $constants
                                                                          .insets
                                                                          .sm,
                                                                    ),
                                                                  ),
                                                                  width:
                                                                      double
                                                                          .infinity,
                                                                  height: 45,
                                                                  child: Center(
                                                                    child: Text(
                                                                      e,
                                                                    ),
                                                                  ),
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
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    $constants.insets.sm,
                                              ),
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
                                              height: 45,
                                              // width: getSize(context).width * 0.45,
                                              child: Row(
                                                children: [
                                                  if (domain == null ||
                                                      domain!.isEmpty)
                                                    Row(
                                                      children: [
                                                        Text("@"),
                                                        SizedBox(
                                                          width:
                                                              $constants
                                                                  .insets
                                                                  .md,
                                                        ),
                                                        Text(
                                                          "Please select a domain",
                                                          style: getTextTheme(
                                                            context,
                                                          ).bodySmall!.copyWith(
                                                            color:
                                                                Colors
                                                                    .grey[700],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  else
                                                    Text("@${domain!}"),
                                                ],
                                              ),
                                            ),
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
                                            context
                                                .t
                                                .auth
                                                .register
                                                .password_hint,
                                        obscureText: true,
                                      ),
                                    ),
                                  ),
                                  if (errorMessage != null &&
                                      context.t.errors[errorMessage] !=
                                          null) ...[
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
                                            (controller) =>
                                                controller.forward(),
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
                                        delay: const Duration(
                                          milliseconds: 500,
                                        ),
                                      ),
                                    ],
                                    onPlay:
                                        (controller) => controller.forward(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        PrimaryButtonSquare(
                                          text:
                                              context
                                                  .t
                                                  .auth
                                                  .login_or_register
                                                  .register,
                                          backgroundColor:
                                              getTheme(context).primary,
                                          onPressed: () async {
                                            if (_usernameController
                                                    .text
                                                    .isNotEmpty &&
                                                _passwordController
                                                    .text
                                                    .isNotEmpty) {
                                              if (!context.mounted) return;
                                              context.read<AuthBloc>().add(
                                                RegisterEvent(
                                                  email:
                                                      "${_usernameController.text}@${domain!}",
                                                  password:
                                                      _passwordController.text,
                                                ),
                                              );
                                            }
                                          },
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
                                    child: Divider(
                                      height: $constants.insets.sm,
                                    ),
                                  ),
                                  SizedBox(width: $constants.insets.sm),
                                  Text("or"),
                                  SizedBox(width: $constants.insets.sm),
                                  Expanded(
                                    child: Divider(
                                      height: $constants.insets.sm,
                                    ),
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
                                  text: context.t.auth.login_or_register.login,
                                  backgroundColor: getTheme(context).primary,
                                  outlined: true,
                                  onPressed: () {
                                    context.go("/auth/login");
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
          );
        },
      ),
    );
  }
}
