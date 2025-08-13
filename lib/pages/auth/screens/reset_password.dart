import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/entities/encryption/encryption_key.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/auth/screens/mnemonic_key.dart';
import 'package:ab_shared/pages/auth/screens/reset_password_code.dart';
import 'package:ab_shared/pages/auth/screens/reset_password_intro.dart';
import 'package:ab_shared/pages/auth/screens/reset_password_new_password.dart';
import 'package:ab_shared/pages/auth/screens/reset_password_recap.dart';
import 'package:ab_shared/pages/auth/screens/reset_password_restore_data_choice.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatefulWidget {
  final String? email;
  final EncryptionService? encryptionService;

  const ResetPassword({super.key, this.email, required this.encryptionService});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  int _currentStep = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _restoreData = true;
  String? _mnemonicKey;
  EncryptionKeyEntity? _newKeySet;

  @override
  void initState() {
    if (widget.email != null) {
      _emailController.text = widget.email!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.auth.reset_password.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
        child: Column(
          children: [
            if (_currentStep == 0)
              ResetPasswordIntro.ResetPasswordIntroduction(
                emailController: _emailController,
                onNextCallback: () {
                  setState(() {
                    _currentStep = 1;
                  });
                },
              ),
            if (_currentStep == 1)
              ResetPasswordCode(
                emailCodeController: _emailCodeController,
                onNextCallback: () {
                  setState(() {
                    _currentStep = 2;
                  });
                  context
                      .read<AuthBloc>()
                      .add(GetBackupKeyForResetPassword(_emailCodeController.text));
                },
              ),
            if (_currentStep == 2)
              ResetPasswordRestoreDataChoice(
                restoreDataChoiceCallback: (reset, mnemonicKey) {
                  setState(() {
                    _restoreData = reset;
                    _mnemonicKey = mnemonicKey;
                    _currentStep = 3;
                  });
                },
              ),
            if (_currentStep == 3)
              ResetPasswordNewPwd(
                passwordController: _passwordController,
                onNextCallback: () {
                  setState(() {
                    _currentStep = 4;
                  });
                },
              ),
            if (_currentStep == 4)
              ResetPasswordRecap(
                email: _emailController.text,
                code: _emailCodeController.text,
                newPassword: _passwordController.text,
                mnemonicKey: _mnemonicKey,
                restoreData: _restoreData,
                onKeySetChanged: (newEncryptionKey) {
                  setState(() {
                    _newKeySet = newEncryptionKey;
                    _currentStep = 5;
                  });
                },
                encryptionService: widget.encryptionService,
              ),
            if (_currentStep == 5 && _newKeySet?.backupPhrase != null)
              MnemonicKey(
                widgetMode: true,
                mnemonic: _newKeySet!.backupPhrase!,
                onSuccess: () {
                  Navigator.pop(context);
                },
              )
          ],
        ),
      ),
    );
  }
}

class ResetPasswordNewPassword {}
