import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ABButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final double? iconSize;
  final VoidCallback onTap;
  final bool? enabled;

  const ABButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.iconSize = 15,
    this.enabled = true,
  });

  @override
  State<ABButton> createState() => _ABButtonState();
}

class _ABButtonState extends State<ABButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isHovering
                ? getTheme(context).surfaceContainer.darken(5)
                : getTheme(context).surfaceContainer,
            borderRadius: BorderRadius.circular($constants.corners.sm),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm,
              vertical: $constants.insets.xxs),
          child: Row(
            children: [
              Icon(widget.icon, size: widget.iconSize),
              SizedBox(width: $constants.insets.xs),
              Text(widget.label),
            ],
          ),
        ),
      ),
    );
  }
}
