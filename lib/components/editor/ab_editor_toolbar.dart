import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';

class ABEditorToolbar extends StatelessWidget {
  final FleatherController editorState;
  const ABEditorToolbar({super.key, required this.editorState});

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      height: 50,
      child: FleatherToolbar(
        children: [
          ToggleStyleButton(
            attribute: ParchmentAttribute.bold,
            icon: CupertinoIcons.bold,
            controller: editorState,
            childBuilder:
                (context, attribute, icon, isToggled, onPressed) =>
                    GestureDetector(
                      onTap: () {
                        if (onPressed != null) {
                          onPressed();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            $constants.corners.md,
                          ),
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
          ),
        ],
      ),
    );
  }
}
