import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class WaitingListStartStep extends StatefulWidget {
  final Function(bool hasCode) onHasCode;
  const WaitingListStartStep({super.key, required this.onHasCode});

  @override
  State<WaitingListStartStep> createState() => _WaitingListStartStepState();
}

class _WaitingListStartStepState extends State<WaitingListStartStep> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: $constants.insets.md),
          Text(
            "We're at capacity!",
            style: getTextTheme(
              context,
            ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "Join the waiting list to get notified when a spot opens up.",
            style: getTextTheme(context).bodyMedium,
          ),
          SizedBox(height: $constants.insets.sm),
          AppTextFormField(
            controller: _emailController,
            labelText: "Email",
            hintText: "Enter your email",
          ),
          SizedBox(height: $constants.insets.sm),
          Center(
            child: TextButton(
              onPressed: () {
                widget.onHasCode(true);
              },
              child: Text(
                "I already have a code",
                style: getTextTheme(
                  context,
                ).bodySmall!.copyWith(color: Colors.grey.shade600),
              ),
            ),
          ),
          PrimaryButtonSquare(
            text: "Join the waiting list",
            onPressed: () {
              //TODO: send the join waiting list request
            },
          ),
        ],
      ),
    );
  }
}
