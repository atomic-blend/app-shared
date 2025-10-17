import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/app/ab_user_display.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_tooltip/super_tooltip.dart';

class AbSyncStatus extends StatefulWidget {
  const AbSyncStatus({super.key});

  @override
  State<AbSyncStatus> createState() => _AbSyncStatusState();
}

final syncStatusPopupController = SuperTooltipController();

class _AbSyncStatusState extends State<AbSyncStatus> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return SuperTooltip(
          hasShadow: true,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          shadowBlurRadius: 10,
          shadowOffset: Offset(0, 10),
          shadowSpreadRadius: 0,
          arrowLength: 10,
          borderColor: Colors.transparent,
          hideTooltipOnBarrierTap: true,
          showBarrier: false,
          controller: syncStatusPopupController,
          content: TapRegion(
            onTapOutside: (event) {
              syncStatusPopupController.hideTooltip();
            },
            child: Container(
              constraints: BoxConstraints(minWidth: 400, minHeight: 400),
              width:
                  isDesktop(context)
                      ? getSize(context).width * 0.3
                      : getSize(context).width * 0.8,
              height:
                  isDesktop(context)
                      ? getSize(context).height * 0.5
                      : getSize(context).height * 0.5,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.xs,
                  vertical: $constants.insets.xs,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedContainer(
                      disableShadow: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                        vertical: $constants.insets.sm,
                      ),
                      child: ABUserDisplay(user: authState.user!),
                    ),
                    SizedBox(height: $constants.insets.sm),
                    Expanded(
                      child: ElevatedContainer(
                        width: double.infinity,
                        disableShadow: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: $constants.insets.sm,
                          vertical: $constants.insets.sm,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Container(
            width: 40,
            height: isDesktop(context) ? 30 : 35,
            decoration: BoxDecoration(
              color: getTheme(context).surfaceContainer,
              borderRadius: BorderRadius.circular($constants.corners.sm),
            ),
            child: GestureDetector(
              onTap: () {
                syncStatusPopupController.showTooltip();
              },
              child: Icon(
                CupertinoIcons.cloud,
                color: Colors.grey.shade600,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
