import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:flutter/material.dart';

class WaitingListCodeStep extends StatefulWidget {
  const WaitingListCodeStep({super.key});

  @override
  State<WaitingListCodeStep> createState() => _WaitingListCodeStepState();
}

class _WaitingListCodeStepState extends State<WaitingListCodeStep> {
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Howdy Cowboy! 🤠"),
        Text("Enter the code you received by email to join the waiting list."),
        AppTextFormField(
          controller: _codeController,
          labelText: "Code",
          hintText: "Enter the code",
        ),
        PrimaryButtonSquare(
          text: "Proceed to registration",
          onPressed: () {
            //TODO: Check if the code is valid
          },
        )
      ],
    );
  }
}