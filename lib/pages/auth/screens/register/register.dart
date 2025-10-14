// ignore_for_file: unused_field

import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/components/widgets/loading_city.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/mnemonic_key.dart';
import 'package:ab_shared/pages/auth/screens/register/backup_email_step.dart';
import 'package:ab_shared/pages/auth/screens/register/personal_infos_step.dart';
import 'package:ab_shared/pages/auth/screens/register/register_email_step.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part 'register.g.dart';

class RegisterParams {
  final String? homeRouteLocation;

  const RegisterParams({this.homeRouteLocation});
}

@TypedGoRoute<RegisterRoute>(path: "/auth/register", name: "register")
class RegisterRoute extends GoRouteData with _$RegisterRoute {
  final RegisterParams? $extra;
  RegisterRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterEmail(homeRouteLocation: $extra?.homeRouteLocation);
  }
}

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({super.key, this.homeRouteLocation});
  final String? homeRouteLocation;

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail>
    with SingleTickerProviderStateMixin {
  final getIt = GetIt.instance;
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _errorMessage;
  String? _index = "register_email";
  final _animationDuration = const Duration(milliseconds: 250);
  late AnimationController _animationController;

  @override
  initState() {
    context.read<AuthBloc>().add(LoadConfig());
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context).surface,
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
            _errorMessage = authState.message;
          }

          if (authState is LoggedIn && authState.isRegistration == false) {
            getIt<GoRouter>().go(widget.homeRouteLocation ?? "/");
          }

          if (authState is LoggedIn && authState.isRegistration == true) {
            return MnemonicKey(
              mnemonic: authState.user!.keySet.backupPhrase!,
              onSuccess: () {
                context.read<AuthBloc>().add(MnemonicDisplayed());
                getIt<GoRouter>().go(widget.homeRouteLocation ?? "/");
              },
            );
          }

          switch (_index) {
            case "register_email":
              return _buildMainLayout(
                RegisterEmailStep(
                  username: _email?.split("@")[0],
                  domain: _email?.split("@")[1],
                  password: _password,
                  onSuccess: (String email, String password) {
                    setState(() {
                      _index = "personal_infos";
                      _email = email;
                      _password = password;
                    });
                  },
                ),
              );
            case "personal_infos":
              return _buildMainLayout(
                PersonalInfosStep(
                  firstName: _firstName,
                  lastName: _lastName,
                  onSuccess: (String firstName, String lastName) {
                    setState(() {
                      _index = "backup_email";
                      _firstName = firstName;
                      _lastName = lastName;
                    });
                  },
                ),
              );
            case "backup_email":
              return _buildMainLayout(
                BackupEmailStep(
                  onSuccess: (String backupEmail) {
                    context.read<AuthBloc>().add(
                      RegisterEvent(
                        email: _email!,
                        password: _password!,
                        firstName: _firstName!,
                        lastName: _lastName!,
                        backupEmail: backupEmail,
                      ),
                    );
                  },
                  nextButtonText: context.t.auth.login_or_register.register,
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildMainLayout(Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: getSize(context).height * 0.15),
        Center(
          child: ElevatedContainer(
            constraints: BoxConstraints(
              minWidth: isDesktop(context) ? 500 : 200,
            ),
            color: getTheme(context).surface,
            width:
                isDesktop(context)
                    ? getSize(context).width * 0.2
                    : getSize(context).width,
            height: getSize(context).height * 0.7,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: $constants.insets.sm,
                vertical: $constants.insets.md,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.md,
                      ),
                      child: GestureDetector(
                        onTap: _goBack,
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.arrow_left, size: 24),
                            SizedBox(width: $constants.insets.sm),
                            Text(
                              context.t.actions.back,
                              style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: $constants.insets.sm),
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
                          delay: const Duration(milliseconds: 300),
                        ),
                      ],
                      onPlay: (controller) => controller.forward(),
                      child: Text(
                        context.t.auth.not_logged_in.register_to_atomic_blend,
                        style:
                            _index == "register_email"
                                ? getTextTheme(context).headlineMedium!
                                    .copyWith(fontWeight: FontWeight.bold)
                                : getTextTheme(context).bodyLarge!.copyWith(),
                      ),
                    ),
                    child,
                    SizedBox(height: $constants.insets.md),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider(height: $constants.insets.sm)),
                        SizedBox(width: $constants.insets.sm),
                        Text("or"),
                        SizedBox(width: $constants.insets.sm),
                        Expanded(child: Divider(height: $constants.insets.sm)),
                      ],
                    ),
                    SizedBox(height: $constants.insets.md),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.md,
                      ),
                      child: Center(
                        child: PrimaryButtonSquare(
                          text: context.t.auth.login_or_register.login,
                          backgroundColor: getTheme(context).primary,
                          outlined: true,
                          onPressed: () {
                            if (_index?.startsWith("register") ?? false) {
                              context.go("/auth/login");
                            } else {
                              context.go("/auth/register");
                            }
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
    );
  }

  void _goBack() {
    switch (_index) {
      case "register_email":
        context.go("/auth/login");
        break;
      case "personal_infos":
        setState(() {
          _index = "register_email";
        });
      case "backup_email":
        setState(() {
          _index = "personal_infos";
        });
        break;
    }
  }
}
