import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/entities/encryption/encryption_key.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/mnemonic_key.dart';
import 'package:ab_shared/pages/auth/screens/reset_password/reset_password_code.dart';
import 'package:ab_shared/pages/auth/screens/reset_password/reset_password_intro.dart';
import 'package:ab_shared/pages/auth/screens/reset_password/reset_password_new_password.dart';
import 'package:ab_shared/pages/auth/screens/reset_password/reset_password_recap.dart';
import 'package:ab_shared/pages/auth/screens/reset_password/reset_password_restore_data_choice.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part 'reset_password.g.dart';

class ResetPasswordParams {
  final String? email;

  const ResetPasswordParams({this.email});
}

@TypedGoRoute<ResetPasswordRoute>(
  path: "/auth/reset-password",
  name: "reset-password",
)
class ResetPasswordRoute extends GoRouteData with _$ResetPasswordRoute {
  final ResetPasswordParams? $extra;
  ResetPasswordRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResetPassword(email: $extra?.email);
  }
}

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, this.email});
  final String? email;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword>
    with SingleTickerProviderStateMixin {
  final getIt = GetIt.instance;
  String? _email;
  String? _emailCode;
  String? _password;
  bool? _restoreData;
  String? _mnemonicKey;
  String? _index = "reset_password_intro";
  final _animationDuration = const Duration(milliseconds: 250);
  late AnimationController _animationController;
  EncryptionKeyEntity? _newKeySet;

  @override
  initState() {
    context.read<AuthBloc>().add(LoadConfig());
    super.initState();
    _animationController = AnimationController(vsync: this);
    if (widget.email != null) {
      _email = widget.email!;
    }
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
          if (authState is LoggedIn && authState.isRegistration == false) {
            getIt<GoRouter>().go("/");
          }

          if (authState is LoggedIn && authState.isRegistration == true) {
            return MnemonicKey(
              mnemonic: authState.user!.keySet.backupPhrase!,
              onSuccess: () {
                context.read<AuthBloc>().add(MnemonicDisplayed());
                getIt<GoRouter>().go("/");
              },
            );
          }

          switch (_index) {
            case "reset_password_intro":
              return _buildMainLayout(
                ResetPasswordIntro(
                  email: _email,
                  onSuccess: (String email) {
                    setState(() {
                      _index = "reset_password_code";
                      _email = email;
                    });
                  },
                ),
              );
            case "reset_password_code":
              return _buildMainLayout(
                ResetPasswordCode(
                  emailCode: _emailCode,
                  onSuccess: (String emailCode) {
                    setState(() {
                      _index = "reset_password_restore_data";
                      _emailCode = emailCode;
                    });
                    context.read<AuthBloc>().add(
                      GetBackupKeyForResetPassword(emailCode),
                    );
                  },
                ),
              );
            case "reset_password_restore_data":
              return _buildMainLayout(
                ResetPasswordRestoreDataChoice(
                  restoreData: _restoreData,
                  mnemonicKey: _mnemonicKey,
                  onSuccess: (bool restoreData, String? mnemonicKey) {
                    setState(() {
                      _index = "reset_password_new_password";
                      _restoreData = restoreData;
                      _mnemonicKey = mnemonicKey;
                    });
                  },
                ),
              );
            case "reset_password_new_password":
              return _buildMainLayout(
                ResetPasswordNewPassword(
                  password: _password,
                  onSuccess: (String password) {
                    setState(() {
                      _index = "reset_password_recap";
                      _password = password;
                    });
                  },
                ),
              );
            case "reset_password_recap":
              return _buildMainLayout(
                ResetPasswordRecap(
                  email: _email!,
                  code: _emailCode!,
                  newPassword: _password!,
                  mnemonicKey: _mnemonicKey,
                  restoreData: _restoreData!,
                  onKeySetChanged: (newEncryptionKey) {
                    setState(() {
                      _newKeySet = newEncryptionKey;
                      _index = "mnemonic_display";
                    });
                  },
                ),
              );
            case "mnemonic_display":
              if (_newKeySet?.backupPhrase != null) {
                return MnemonicKey(
                  mnemonic: _newKeySet!.backupPhrase!,
                  onSuccess: () {
                    Navigator.pop(context);
                  },
                );
              }
              return const SizedBox.shrink();
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
                    : getSize(context).width * 0.9,
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
                        context.t.auth.reset_password.title,
                        style:
                            _index == "reset_password_intro"
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
        ),
      ],
    );
  }

  void _goBack() {
    switch (_index) {
      case "reset_password_intro":
        context.go("/auth/login");
        break;
      case "reset_password_code":
        setState(() {
          _index = "reset_password_intro";
        });
        break;
      case "reset_password_restore_data":
        setState(() {
          _index = "reset_password_code";
        });
        break;
      case "reset_password_new_password":
        setState(() {
          _index = "reset_password_restore_data";
        });
        break;
      case "reset_password_recap":
        setState(() {
          _index = "reset_password_new_password";
        });
        break;
    }
  }
}
