import 'package:flutter/material.dart';
import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class AddParticipantDialog extends StatefulWidget {
  const AddParticipantDialog({
    super.key,
  });

  @override
  State<AddParticipantDialog> createState() => _AddParticipantDialogState();
}

class _AddParticipantDialogState extends State<AddParticipantDialog> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiModal(
      title: 'Add new participant',
      actions: [
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.secondary,
          title: 'Cancel',
          onTap: () => Navigator.of(context).pop(),
        ),
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Add participant',
          onTap: () async => Navigator.of(context).pop(textController.text),
        ),
      ],
      child: TextField(
        controller: textController,
        onSubmitted: (_) => Navigator.of(context).pop(textController.text),
        cursorColor: ThemeColors.primary,
        focusNode: FocusNode()..requestFocus(),
        decoration: const InputDecoration(
          hintText: 'Name',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.primary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
