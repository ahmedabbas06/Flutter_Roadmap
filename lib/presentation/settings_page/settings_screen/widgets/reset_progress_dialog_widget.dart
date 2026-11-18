import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class ResetProgressDialogWidget extends StatelessWidget {
  final VoidCallback onConfirm;

  ResetProgressDialogWidget({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    AppLocalizations loc = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(loc.translate('resetProgress')),
      content: Text(loc.translate('resetProgressConfirm')),
      actions: [
        TextButton(
          child: Text(loc.translate('cancel')),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text(loc.translate('confirm'), style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
        ),
      ],
    );
  }
}
