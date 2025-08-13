import 'package:ab_shared/components/buttons/icon_text_button.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/account/change_pwd_modal.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  final EncryptionService encryptionService;
  const Security({super.key, required this.encryptionService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: Text(
          context.t.account.security_and_privacy.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.sm,
        ),
        child: Column(
          children: [
            IconTextButton(
              text:
                  context.t.account.security_and_privacy.change_password.title,
              icon: CupertinoIcons.padlock,
              iconContainer: true,
              iconSize: 20,
              iconColor: Colors.grey[700],
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => ChangePwdModal(
                    encryptionService: encryptionService,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
