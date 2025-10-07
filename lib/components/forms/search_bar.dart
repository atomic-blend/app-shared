import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class ABSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final String? placeholder;
  final bool showKeyboardShortcut;

  const ABSearchBar({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onClear,
    this.placeholder,
    this.showKeyboardShortcut = false,
  });

  @override
  State<ABSearchBar> createState() => _ABSearchBarState();
}

class _ABSearchBarState extends State<ABSearchBar> {
  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: isDesktop(context) ? 30 : 35,
      decoration: BoxDecoration(
        color: theme.surfaceContainer,
        borderRadius: BorderRadius.circular($constants.corners.sm),
      ),
      child: Row(
        children: [
          // Search icon
          Padding(
            padding: EdgeInsets.only(
              left: $constants.insets.xs,
              right: $constants.insets.xxs,
            ),
            child: Icon(
              Icons.search,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
              size: 16,
            ),
          ),
          // Text field
          Expanded(
            child: TextField(
              controller: widget.controller,
              style: TextStyle(
                color: isDark ? Colors.white : theme.surfaceContainer,
                fontSize: 12,
              ),
              decoration: InputDecoration(
                fillColor: theme.surfaceContainer,
                hintText: widget.placeholder ?? 'Search',
                hintStyle: TextStyle(
                  color:
                      isDark
                          ? Colors.grey[500]
                          : theme.onSurfaceVariant.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: $constants.insets.xxs,
                ),
                isDense: true,
              ),

              onSubmitted: widget.onSubmitted,
              onChanged: (value) {
                if (value.isEmpty && widget.onClear != null) {
                  widget.onClear!();
                  return;
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
          // Keyboard shortcut indicator
          if (widget.showKeyboardShortcut)
            Padding(
              padding: EdgeInsets.only(right: $constants.insets.xs),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.xxs,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color:
                      isDark
                          ? Colors.grey.shade800
                          : theme.outline.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular($constants.corners.xs),
                ),
                child: Text(
                  '⌘K',
                  style: TextStyle(
                    color: isDark ? Colors.grey[400] : theme.onSurfaceVariant,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
