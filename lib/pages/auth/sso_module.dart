import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/widgets/loading_city.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/mnemonic_key.dart';
import 'package:ab_shared/pages/auth/screens/register_email.dart';
import 'package:ab_shared/pages/auth/screens/login_or_register.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SSOModule extends StatefulWidget {
  final VoidCallback? onAuthSuccess;
  final EncryptionService? encryptionService;
  final ApiClient? globalApiClient;
  final SharedPreferences? prefs;
  final EnvModel? env;
  const SSOModule({
    super.key,
    this.onAuthSuccess,
    this.encryptionService,
    this.globalApiClient,
    this.prefs,
    this.env,
  });

  @override
  State<SSOModule> createState() => _SSOModuleState();
}

class _SSOModuleState extends State<SSOModule> {
  String? email;
  String? password;
  String? errorCode;
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
            errorCode = state.message;
          });
        }
        if (state is LoggedIn && state.isRegistration == true) {
          setState(() {
            _step = 5;
          });
        }
        if (state is LoggedIn && state.isRegistration == false) {
          widget.onAuthSuccess?.call();
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
            if (authState is LoggedIn && authState.isRegistration == true) {
              return MnemonicKey(
                onSuccess: () {
                  context.read<AuthBloc>().add(MnemonicDisplayed());
                },
                mnemonic: authState.user?.keySet.backupPhrase ?? '',
              );
            }
            switch (_step) {
              case 0:
                return LoginOrRegisterScreen(
                  encryptionService: widget.encryptionService,
                  errorCode: errorCode,
                  onRegister: () {
                    setState(() {
                      _step = 1;
                    });
                  },
                );
              case 1:
                return RegisterEmail(
                  username: email,
                  errorCode: errorCode,
                  onLogin: () {
                    setState(() {
                      _step = 0;
                    });
                  },
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
