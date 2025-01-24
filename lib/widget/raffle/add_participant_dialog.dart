import 'package:flutter/material.dart';
import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:flutter_belgium/widget/provider/app_theme_localizer.dart';
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
    return AppThemeLocalizer(
      builder: (context, theme, localization) => ImpaktfullUiModal(
        title: localization.dialogRaffleNewParticipantTitle,
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            title: localization.dialogRaffleNewParticipantSecondaryBtn,
            onTap: () => Navigator.of(context).pop(),
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: localization.dialogRaffleNewParticipantPrimaryBtn,
            onTap: () async => Navigator.of(context).pop(textController.text),
          ),
        ],
        child: TextField(
          controller: textController,
          cursorColor: ThemeColors.primary,
          decoration: InputDecoration(
            hintText: localization.dialogRaffleNewParticipantInputName,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ThemeColors.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
