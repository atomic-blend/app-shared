import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonalInfosStep extends StatefulWidget {
  final Function(String firstName, String lastName) onSuccess;
  const PersonalInfosStep({super.key, required this.onSuccess});

  @override
  State<PersonalInfosStep> createState() => _PersonalInfosStepState();
}

class _PersonalInfosStepState extends State<PersonalInfosStep> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: $constants.insets.md),
            Text(
              context.t.auth.register.lets_get_to_know_you,
              style: getTextTheme(
                context,
              ).headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              context.t.auth.register.personal_info_description,
              style: getTextTheme(
                context,
              ).bodySmall!.copyWith(color: Colors.grey),
            ),
            SizedBox(height: $constants.insets.sm),
            AppTextFormField(
              controller: _firstNameController,
              hintText: context.t.auth.register.first_name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.t.auth.register.first_name_required;
                }
                return null;
              },
            ),
            AppTextFormField(
              controller: _lastNameController,
              hintText: context.t.auth.register.last_name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.t.auth.register.last_name_required;
                }
                return null;
              },
            ),
            SizedBox(height: $constants.insets.md),
            PrimaryButtonSquare(
              text: context.t.auth.login_or_register.next,
              backgroundColor: getTheme(context).primary,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  widget.onSuccess(
                    _firstNameController.text,
                    _lastNameController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
