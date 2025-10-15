import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordRestoreDataChoice extends StatefulWidget {
  final bool? restoreData;
  final String? mnemonicKey;
  final Function(bool restoreData, String? mnemonicKey) onSuccess;
  const ResetPasswordRestoreDataChoice({
    super.key,
    required this.onSuccess,
    this.restoreData,
    this.mnemonicKey,
  });

  @override
  State<ResetPasswordRestoreDataChoice> createState() =>
      _ResetPasswordRestoreDataChoiceState();
}

class _ResetPasswordRestoreDataChoiceState
    extends State<ResetPasswordRestoreDataChoice> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mnemonicKeyController = TextEditingController();
  bool? _restoreData;
  bool? _confirmReset = false;

  @override
  void initState() {
    super.initState();
    _restoreData = widget.restoreData;
    _mnemonicKeyController.text = widget.mnemonicKey ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: $constants.insets.md),
          Text(
            context.t.auth.reset_password.do_you_have_your_mnemonic_key,
            style: getTextTheme(
              context,
            ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            context.t.auth.reset_password.backup_key_description,
            style: getTextTheme(
              context,
            ).bodySmall!.copyWith(color: Colors.grey),
          ),
          SizedBox(height: $constants.insets.sm),
          PrimaryButtonSquare(
            text: context.t.auth.reset_password.yes_i_have,
            outlined: _restoreData == true ? false : true,
            backgroundColor: getTheme(context).primary,
            onPressed: () {
              setState(() {
                _restoreData = true;
              });
            },
          ),
          SizedBox(height: $constants.insets.sm),
          PrimaryButtonSquare(
            text: context.t.auth.reset_password.no_i_dont,
            outlined: _restoreData == false ? false : true,
            backgroundColor: getTheme(context).error,
            onPressed: () async {
              setState(() {
                _restoreData = false;
              });
            },
          ),
          if (_restoreData == false)
            Padding(
              padding: EdgeInsets.only(top: $constants.insets.sm),
              child: Row(
                children: [
                  CupertinoCheckbox(
                    value: _confirmReset ?? false,
                    onChanged: (value) {
                      setState(() {
                        _confirmReset = value;
                      });
                    },
                  ),
                  SizedBox(width: $constants.insets.xs),
                  Flexible(
                    child: Text(
                      context.t.auth.reset_password.reset_data_warning,
                    ),
                  ),
                ],
              ),
            ),
          if (_restoreData == true)
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(top: $constants.insets.sm),
                child: AppTextFormField(
                  controller: _mnemonicKeyController,
                  labelText: context.t.auth.reset_password.mnemonic_key,
                  labelDescription:
                      context.t.auth.reset_password.mnemonic_key_description,
                  hintText: context.t.auth.reset_password.mnemonic_key_hint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context
                          .t
                          .auth
                          .reset_password
                          .mnemonic_key_required;
                    }
                    return null;
                  },
                ),
              ),
            ),
          SizedBox(height: $constants.insets.md),
          PrimaryButtonSquare(
            text: context.t.actions.next,
            backgroundColor: getTheme(context).primary,
            onPressed: () async {
              if (_restoreData == null) {
                return;
              }

              if (_restoreData == true) {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                widget.onSuccess(_restoreData!, _mnemonicKeyController.text);
              } else {
                if (_confirmReset != true) {
                  return;
                }
                widget.onSuccess(_restoreData!, null);
              }
            },
          ),
        ],
      ),
    );
  }
}
