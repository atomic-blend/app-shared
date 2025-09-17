import 'package:ab_shared/utils/constants.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';

class ABEditor extends StatefulWidget {
  final FleatherController editorState;
  const ABEditor({super.key, required this.editorState});

  @override
  State<ABEditor> createState() => _ABEditorState();
}

class _ABEditorState extends State<ABEditor> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: FleatherEditor(controller: widget.editorState),
    );
  }
}