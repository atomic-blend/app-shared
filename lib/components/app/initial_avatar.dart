import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class InitialAvatar extends StatelessWidget {
  final String name;
  const InitialAvatar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all($constants.insets.xs),
      decoration: BoxDecoration(
        color: getTheme(context).surface,
        borderRadius: BorderRadius.circular($constants.corners.md),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Center(
        child: Text(
          _getInitials(name),
          style: getTextTheme(context).bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '';

    return name
        .trim()
        .split(' ')
        .where((word) => word.isNotEmpty)
        .take(3)
        .map((word) => word[0].toUpperCase())
        .join();
  }
}
