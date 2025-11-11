import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrimaryButtonSquare extends StatelessWidget {
  const PrimaryButtonSquare({
    super.key,
    this.onPressed,
    this.leading,
    this.emoji,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.text,
    this.textStyle,
    this.backgroundColor,
    this.trailing,
    this.textColor,
    this.border,
    this.height,
    this.width,
    this.outlined,
  });

  final VoidCallback? onPressed;
  final String? emoji;
  final Widget? leading;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Widget? trailing;
  final String? text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Border? border;
  final double? height;
  final double? width;
  final bool? outlined;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border:
                outlined == true
                    ? Border.all(
                      color: backgroundColor ?? getTheme(context).primary,
                    )
                    : border,
            borderRadius: BorderRadius.circular($constants.corners.md),
          ),
          height: height ?? 50,
          width: width,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                outlined == true
                    ? null
                    : backgroundColor ?? getTheme(context).primary,
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    $constants.corners.md,
                  ), // This makes it completely square
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leading != null) ...[
                  leading!,
                  SizedBox(width: $constants.insets.xs),
                ],
                if (emoji != null) ...[
                  Text(emoji!, style: const TextStyle(fontSize: 23)),
                  SizedBox(width: $constants.insets.xs),
                ],
                if (icon != null) ...[
                  Icon(icon, color: iconColor, size: iconSize),
                  SizedBox(width: $constants.insets.xs),
                ],
                if (text != null) ...[
                  Center(
                    child: AutoSizeText(
                      text!,
                      maxLines: 1,
                      style:
                          textStyle ??
                          getTextTheme(context).bodyMedium!.copyWith(
                            color:
                                outlined == true
                                    ? backgroundColor ??
                                        getTheme(context).primary
                                    : textColor ?? Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (trailing != null) ...[
          Positioned(
            top: 0,
            bottom: 0,
            right: $constants.insets.xs,
            child: trailing!,
          ),
        ],
      ],
    );
  }
}
