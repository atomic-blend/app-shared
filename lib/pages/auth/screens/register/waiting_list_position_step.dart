import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaitingListPositionStep extends StatefulWidget {
  const WaitingListPositionStep({super.key});

  @override
  State<WaitingListPositionStep> createState() =>
      _WaitingListPositionStepState();
}

class _WaitingListPositionStepState extends State<WaitingListPositionStep> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! JoinWaitingListSuccess) {
          return const SizedBox.shrink();
        }
        return Column(
          children: [
            Text("You're in!"),
            Text("You have successfully joined the waiting list!"),

            Text("Your position in the waiting list is:"),
            Text(
              authState.beforeCount.toString(),
              style: getTextTheme(
                context,
              ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
