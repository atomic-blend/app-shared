import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class WaitingListPositionStep extends StatefulWidget {
  const WaitingListPositionStep({super.key});

  @override
  State<WaitingListPositionStep> createState() =>
      _WaitingListPositionStepState();
}

class _WaitingListPositionStepState extends State<WaitingListPositionStep> {
  final getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! JoinWaitingListSuccess) {
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: $constants.insets.md),
            Text(
              "You're in!",
              style: getTextTheme(
                context,
              ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text("You have successfully joined the waiting list!"),
            SizedBox(height: $constants.insets.sm),

            Text("Your position in the waiting list is:"),
            Text(
              ((authState.beforeCount ?? 0) + 1).toString(),
              style: getTextTheme(
                context,
              ).titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: $constants.insets.sm),
            PrimaryButtonSquare(
              width: getSize(context).width * 0.25,
              text: context.t.waiting_list.back_to_home,
              onPressed: () {
                getIt<GoRouter>().go("/");
              },
            ),
          ],
        );
      },
    );
  }
}
