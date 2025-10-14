import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/entities/encryption/encryption_key.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ResetPasswordRecap extends StatefulWidget {
  final String email;
  final String code;
  final String newPassword;
  final String? mnemonicKey;
  final bool restoreData;
  final Function(EncryptionKeyEntity?) onKeySetChanged;

  const ResetPasswordRecap({
    super.key,
    required this.email,
    required this.code,
    this.mnemonicKey,
    required this.restoreData,
    required this.newPassword,
    required this.onKeySetChanged,
  });

  @override
  State<ResetPasswordRecap> createState() => _ResetPasswordRecapState();
}

class _ResetPasswordRecapState extends State<ResetPasswordRecap> {
  final getIt = GetIt.instance;
  late final EncryptionService? encryptionService;

  // user original backup key, from the backend
  String? _backupKey;
  String? _mnemonicSalt;

  // updated keySet, from the backup data key
  EncryptionKeyEntity? _newKeySet;

  @override
  void initState() {
    super.initState();
    encryptionService = getIt<EncryptionService>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState authState) {
        if (authState is ConfirmResetPasswordSuccess) {
          widget.onKeySetChanged.call(_newKeySet);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          if (authState is GetBackupKeyForResetPasswordSuccess) {
            _backupKey = authState.backupKey;
            _mnemonicSalt = authState.backupSalt;
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: $constants.insets.md),
                Text(
                  context.t.auth.reset_password.title,
                  style: getTextTheme(
                    context,
                  ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  context.t.auth.reset_password.recap_subtitle,
                  style: getTextTheme(
                    context,
                  ).bodySmall!.copyWith(color: Colors.grey),
                ),
                SizedBox(height: $constants.insets.sm),
                Container(
                  padding: EdgeInsets.all($constants.insets.sm),
                  decoration: BoxDecoration(
                    color: getTheme(context).surfaceContainer,
                    borderRadius: BorderRadius.circular($constants.insets.sm),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            context.t.auth.reset_password.email,
                            style: getTextTheme(context).bodyMedium,
                          ),
                          const Spacer(),
                          Text(
                            widget.email,
                            style: getTextTheme(context).bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: $constants.insets.xs),
                      Row(
                        children: [
                          Text(
                            context.t.auth.reset_password.confirmation_code,
                            style: getTextTheme(context).bodyMedium,
                          ),
                          const Spacer(),
                          Text(
                            widget.code.replaceRange(
                              0,
                              widget.code.length - 4,
                              "****",
                            ),
                            style: getTextTheme(context).bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: $constants.insets.xs),
                      Row(
                        children: [
                          Text(
                            context.t.auth.reset_password.new_password,
                            style: getTextTheme(context).bodyMedium,
                          ),
                          const Spacer(),
                          Text(
                            widget.newPassword.replaceRange(
                              0,
                              widget.newPassword.length - 4,
                              "****",
                            ),
                            style: getTextTheme(context).bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: $constants.insets.xs),
                      Row(
                        children: [
                          Text(
                            context
                                .t
                                .auth
                                .reset_password
                                .do_you_have_your_mnemonic_key,
                            style: getTextTheme(context).bodyMedium,
                          ),
                          const Spacer(),
                          Text(
                            widget.restoreData
                                ? context.t.auth.reset_password.yes
                                : context.t.auth.reset_password.no,
                            style: getTextTheme(context).bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: $constants.insets.sm),
                      if (widget.restoreData)
                        Row(
                          children: [
                            Text(
                              context.t.auth.reset_password.mnemonic_key,
                              style: getTextTheme(context).bodyMedium,
                            ),
                            const Spacer(),
                            Text(
                              widget.mnemonicKey!.replaceRange(
                                0,
                                widget.mnemonicKey!.length - 4,
                                "****",
                              ),
                              style: getTextTheme(context).bodyMedium,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(height: $constants.insets.md),
                PrimaryButtonSquare(
                  text: context.t.auth.reset_password.confirm_reset,
                  backgroundColor: getTheme(context).primary,
                  onPressed: () async {
                    if (widget.restoreData) {
                      // if restoreData is true, use mnemonicKey to decrypt the existing backup key, then generate a new keySet from an existing data key
                      _newKeySet = await encryptionService!
                          .generateKeySetFromBackupKey(
                            backupKey: _backupKey!,
                            backupSalt: _mnemonicSalt!,
                            mnemonic: widget.mnemonicKey!,
                            newPassword: widget.newPassword,
                            agePublicKey: authState.user?.keySet.publicKey,
                          );
                    } else {
                      // generate a new keySet from the new password
                      _newKeySet = await encryptionService!.generateKeySet(
                        widget.newPassword,
                      );
                    }

                    if (_newKeySet == null) {
                      return;
                    }

                    if (!context.mounted) {
                      return;
                    }
                    context.read<AuthBloc>().add(
                      ConfirmResetPassword(
                        resetCode: widget.code,
                        resetData: !widget.restoreData,
                        newPassword: widget.newPassword,
                        userKey: _newKeySet!.userKey,
                        userSalt: _newKeySet!.salt,
                        backupKey: _newKeySet!.backupKey,
                        backupSalt: _newKeySet!.mnemonicSalt,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
