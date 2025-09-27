import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/widgets/loading_city.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/mnemonic_key.dart';
import 'package:ab_shared/pages/auth/screens/register_email.dart';
import 'package:ab_shared/pages/auth/screens/register_password.dart';
import 'package:ab_shared/pages/auth/screens/login_or_register.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOrRegisterModal extends StatefulWidget {
  final VoidCallback onAuthSuccess;
  final EncryptionService? encryptionService;
  final ApiClient? globalApiClient;
  final SharedPreferences? prefs;
  final EnvModel? env;
  const LoginOrRegisterModal({
    super.key,
    required this.onAuthSuccess,
    required this.encryptionService,
    required this.globalApiClient,
    required this.prefs,
    required this.env,
  });

  @override
  State<LoginOrRegisterModal> createState() => _LoginOrRegisterModalState();
}

class _LoginOrRegisterModalState extends State<LoginOrRegisterModal> {
  String? email;
  String? password;
  String? errorMessage;
  int _step = 0;

  @override
  void initState() {
    context.read<AuthBloc>().add(const LoadConfig());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) async {
        if (state is AuthError) {
          setState(() {
            errorMessage = state.message;
          });
        }
        if (state is LoggedIn && state.isRegistration == true) {
          setState(() {
            _step = 5;
          });
        }
        if (state is LoggedIn && state.isRegistration == false) {
          widget.onAuthSuccess.call();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pop();
          });
        }
      },
      child: SizedBox(
        height: double.infinity,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            if (authState is Loading) {
              return LoadingAnimated(
                imageWidth: getSize(context).width * 0.6,
                title: context.t.loading.simple,
              );
            }
            switch (_step) {
              case 0:
                return LoginOrRegisterScreen(
                  encryptionService: widget.encryptionService,
                  onRegister: () {
                    setState(() {
                      _step = 1;
                    });
                  },
                );
              case 1:
                return RegisterEmail(
                  username: email,
                  onLogin: () {
                    setState(() {
                      _step = 1;
                    });
                  },
                );
              // case 3:
              //   return MnemonicKey(
              //     onSuccess: () {},
              //     mnemonic: authState.user?.keySet.backupPhrase ?? '',
              //   );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
