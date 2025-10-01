import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ABAppsPopup extends StatelessWidget {
  const ABAppsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isDesktop(context) ? 400 : 200,
          maxHeight: isDesktop(context) ? 400 : 200,
        ),
        child: SizedBox(
          width: isDesktop(context) ? 400 : 200,
          child: StaggeredGrid.count(
            crossAxisCount: 6,
            children: [
              _buildAppListItem(
                context,
                "assets/images/atomic_mail_logo.png",
                "Atomic Mail",
              ),
              _buildAppListItem(
                context,
                "assets/images/atomic_task_logo.png",
                "Atomic Task",
              ),
              _buildAppListItem(
                context,
                "assets/images/atomic_notes_logo.png",
                "Atomic Notes",
              ),
            ],
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular($constants.corners.md),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.md),
              child: Image.asset("assets/images/atomic_blend_logo.png"),
            ),
          ),
          SizedBox(width: $constants.insets.xs),
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  context.t.app_name,
                  style: getTextTheme(
                    context,
                  ).bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all the apps",
                  style: getTextTheme(
                    context,
                  ).bodySmall!.copyWith(color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          SizedBox(width: $constants.insets.sm),
          Icon(CupertinoIcons.chevron_up_chevron_down, size: 12),
        ],
      ),
    );
  }

  Widget _buildAppListItem(
    BuildContext context,
    String assetName,
    String label,
  ) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1.7,
      child: GestureDetector(
        onTap: () => {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular($constants.corners.lg),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular($constants.corners.lg),
                child: Image.asset(assetName, package: "ab_shared"),
              ),
            ),
            SizedBox(height: $constants.insets.xs),
            Text(label),
          ],
        ),
      ),
    );
  }
}
