import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/app/ab_header.dart';
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
  final List<SyncedElement> syncElements;
  final bool? isSyncing;
  const AbSyncStatus({super.key, required this.syncElements, this.isSyncing});

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
              constraints: BoxConstraints(minWidth: 400),
              width:
                  isDesktop(context)
                      ? getSize(context).width * 0.3
                      : getSize(context).width * 0.8,
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
                    ElevatedContainer(
                      width: double.infinity,
                      disableShadow: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.sm,
                        vertical: $constants.insets.sm,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            widget.syncElements
                                .map((element) => _buildSyncElement(element))
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              syncStatusPopupController.showTooltip();
            },
            child: Stack(
              children: [
                Container(
                  width: 40,
                  height: isDesktop(context) ? 30 : 35,
                  decoration: BoxDecoration(
                    color: getTheme(context).surfaceContainer,
                    borderRadius: BorderRadius.circular($constants.corners.sm),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.cloud,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                  ),
                ),
                if (widget.isSyncing ?? false) ...[
                  Positioned(
                    bottom: $constants.insets.xxs + 2,
                    right: $constants.insets.xs,
                    child: SizedBox(
                      width: 8,
                      height: 8,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: getTheme(context).primary,
                      ),
                    ),
                  ),
                ] else ...[
                  Positioned(
                    bottom: $constants.insets.xxs + 2,
                    right: $constants.insets.xxs + 2,
                    child: Icon(
                      CupertinoIcons.checkmark_circle_fill,
                      size: 10,
                      color: getTheme(context).primary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSyncElement(SyncedElement element) {
    return Padding(
      padding: EdgeInsets.only(bottom: $constants.insets.xs),
      child: ElevatedContainer(
        color: getTheme(context).surface,
        disableShadow: true,
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.xs,
        ),
        child: Row(
          children: [
            ElevatedContainer(
              color: getTheme(context).surfaceContainer,
              disableShadow: true,
              borderRadius: $constants.corners.sm,
              padding: EdgeInsets.all($constants.insets.xs),
              child: Icon(element.icon),
            ),
            SizedBox(width: $constants.insets.sm),
            Text(element.label),
            Spacer(),
            Text(
              "${element.count} ${element.label.toLowerCase()} ${context.t.sync_status.synced}",
              style: getTextTheme(
                context,
              ).bodyMedium!.copyWith(color: Colors.grey.shade500),
            ),
            SizedBox(width: $constants.insets.xs),
            Icon(
              CupertinoIcons.checkmark_circle_fill,
              color: getTheme(context).primary,
            ),
          ],
        ),
      ),
    );
  }
}
