import 'package:flutter/material.dart';
import 'package:flutter_belgium/style/theme.dart';
import 'package:flutter_belgium/widget/general/button.dart';

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
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter name',
              ),
              TextField(
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      onTap: () async => Navigator.of(context).pop(),
                      text: 'Cancel',
                      fullWidth: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Button(
                      onTap: () async => Navigator.of(context).pop(textController.text),
                      text: 'Add participant',
                      fullWidth: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
