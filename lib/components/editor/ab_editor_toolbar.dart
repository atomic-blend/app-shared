import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ABEditorToolbar extends StatelessWidget {
  final FleatherController editorState;
  const ABEditorToolbar({super.key, required this.editorState});

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      height: 50,
      child: FleatherToolbar(
        children: [
          _buildToggleStyleButton(
            editorState: editorState,
            attribute: ParchmentAttribute.bold,
            icon: CupertinoIcons.bold,
          ),
          _buildToggleStyleButton(
            editorState: editorState,
            attribute: ParchmentAttribute.italic,
            icon: CupertinoIcons.italic,
          ),
          _buildToggleStyleButton(
            editorState: editorState,
            attribute: ParchmentAttribute.underline,
            icon: CupertinoIcons.underline,
          ),
          _buildToggleStyleButton(
            editorState: editorState,
            attribute: ParchmentAttribute.strikethrough,
            icon: CupertinoIcons.strikethrough,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: $constants.insets.sm,
              bottom: $constants.insets.sm,
              right: $constants.insets.xs,
            ),
            child: VerticalDivider(width: 5),
          ),
          _buildColorButton(
            editorState: editorState,
            attribute: ParchmentAttribute.backgroundColor,
            icon: CupertinoIcons.layers,
            nullColorLabel: 'Transparent',
          ),
          SizedBox(width: $constants.insets.xs),
          _buildColorButton(
            editorState: editorState,
            attribute: ParchmentAttribute.foregroundColor,
            icon: CupertinoIcons.textformat,
            nullColorLabel: 'Transparent',
          ),
        ],
      ),
    );
  }

  Widget _buildToggleStyleButton({
    required FleatherController editorState,
    required ParchmentAttribute attribute,
    required IconData icon,
  }) {
    return ToggleStyleButton(
      attribute: attribute,
      icon: icon,
      controller: editorState,
      childBuilder:
          (context, attribute, icon, isToggled, onPressed) => GestureDetector(
            onTap: () {
              if (onPressed != null) {
                onPressed();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular($constants.corners.md),
                color:
                    isToggled
                        ? getTheme(context).surface
                        : getTheme(context).surfaceContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon),
              ),
            ),
          ),
    );
  }

  Widget _buildColorButton({
    required FleatherController editorState,
    required ColorParchmentAttributeBuilder attribute,
    required IconData icon,
    required String nullColorLabel,
  }) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular($constants.corners.xxl),
          child: ColorButton(
            controller: editorState,
            attributeKey: attribute,
            nullColorLabel: nullColorLabel,
            builder: (context, color) {
              return Icon(icon, size: 20);
            },
          ),
        ),
        // Positioned(
        //   top: 0,
        //   right: 0,
        //   bottom: 0,
        //   left: 0,
        //   child: Icon(CupertinoIcons.color_filter),
        // ),
      ],
    );
  }
}
