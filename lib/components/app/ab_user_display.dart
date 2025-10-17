import 'package:ab_shared/components/app/initial_avatar.dart';
import 'package:ab_shared/entities/user/user.entity.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class ABUserDisplay extends StatelessWidget {
  final bool collapsed;
  final UserEntity user;
  const ABUserDisplay({super.key, this.collapsed = false, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (collapsed != true) SizedBox(width: $constants.insets.xs),
        InitialAvatar(
          size: 50,
          borderRadius: $constants.corners.lg,
          name:
              user.firstName != null
                  ? "${user.firstName} ${user.lastName}"
                  : "Atomic Blend",
        ),
        if (collapsed != true) ...[
          SizedBox(width: $constants.insets.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  user.firstName != null
                      ? "${user.firstName}${user.lastName != null ? " ${user.lastName}" : ""}"
                      : context.t.app_name,
                  style: getTextTheme(
                    context,
                  ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  user.email ?? "",
                  maxLines: 1,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                  style: getTextTheme(context).bodyMedium!.copyWith(),
                ),
              ],
            ),
          ),
          SizedBox(width: $constants.insets.sm),
          Icon(CupertinoIcons.chevron_up_chevron_down, size: 12),
        ],
      ],
    );
  }
}
