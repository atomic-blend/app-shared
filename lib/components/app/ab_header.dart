import 'package:ab_shared/components/app/ab_sync_status.dart';
import 'package:ab_shared/components/forms/search_bar.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SyncedElement {
  final Key key;
  final String label;
  final IconData icon;
  final int count;
  final int? total;

  const SyncedElement({
    required this.key,
    required this.label,
    required this.icon,
    required this.count,
    this.total,
  });
}

class ABHeader extends StatefulWidget {
  final String title;
  final List<SyncedElement> syncedElements;
  final bool? isSyncing;
  const ABHeader({
    super.key,
    required this.title,
    this.syncedElements = const [],
    this.isSyncing,
  });

  @override
  State<ABHeader> createState() => _ABHeaderState();
}

class _ABHeaderState extends State<ABHeader> {
  final getIt = GetIt.instance;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          isDesktop(context)
              ? EdgeInsets.only(
                left: $constants.insets.sm,
                right: $constants.insets.sm,
                top: $constants.insets.xs,
                bottom: $constants.insets.xs,
              )
              : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (!isDesktop(context))
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(CupertinoIcons.bars),
                ),
            ],
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: getSize(context).width * 0.4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ABSearchBar(
                    controller: controller,
                    showClearButton: true,
                    onSubmitted: (value) {
                      context.go("/search?q=$value");
                    },
                    onChanged: (value) {
                      if (GoRouterState.of(context).uri.path == "/search") {
                        context.go("/search?q=$value");
                      }
                    },
                  ),
                ),
                if (isDesktop(context)) ...[
                  SizedBox(width: $constants.insets.xs),
                  AbSyncStatus(
                    syncElements: widget.syncedElements,
                    isSyncing: widget.isSyncing,
                  ),
                ],
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!isDesktop(context))
                AbSyncStatus(
                  syncElements: widget.syncedElements,
                  isSyncing: widget.isSyncing,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
