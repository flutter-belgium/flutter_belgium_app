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
    return ImpaktfullDialog(
      title: 'Add new participant',
      secondaryLabel: 'cancel',
      onSecondaryTapped: () => Navigator.of(context).pop(),
      primaryLabel: 'Add participant',
      onPrimaryTapped: () async => Navigator.of(context).pop(textController.text),
      child: TextField(
        controller: textController,
        cursorColor: ThemeColors.primary,
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
