import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';

class ContinueLearningButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  ContinueLearningButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppLocalizations loc = AppLocalizations.of(context)!;

    return CustomButtonWidget(
      text: loc.translate('continueLearning'),
      icon: Icons.play_circle_fill,
      onPressed: onPressed,
    );
  }
}
