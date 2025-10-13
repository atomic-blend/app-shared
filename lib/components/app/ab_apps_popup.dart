import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ABAppsPopup extends StatelessWidget {
  final bool? collapsed;
  const ABAppsPopup({super.key, this.collapsed = false});

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      backgroundColor: getTheme(context).surface,
      content: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: isDesktop(context) ? 400 : 200),
        child: SizedBox(
          width: isDesktop(context) ? 400 : getSize(context).width * 0.8,
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
        mainAxisAlignment:
            collapsed != true
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular($constants.corners.lg),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.lg),
              child: Image.asset("assets/images/atomic_blend_logo.png"),
            ),
          ),
          if (collapsed != true) ...[
            SizedBox(width: $constants.insets.sm),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    context.t.app_name,
                    style: getTextTheme(
                      context,
                    ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all the apps",
                    style: getTextTheme(
                      context,
                    ).bodyMedium!.copyWith(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(CupertinoIcons.chevron_up_chevron_down, size: 12),
          ],
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
            ElevatedContainer(
              width: 60,
              height: 60,
              borderRadius: $constants.corners.lg,
              border: Border.all(
                color:
                    isDarkMode(context)
                        ? Colors.grey.shade600
                        : Colors.grey.shade300,
                width: 1,
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
