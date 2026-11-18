import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class PhaseFilterTabsWidget extends StatelessWidget {
  final int selectedPhase;
  final ValueChanged<int> onPhaseSelected;

  PhaseFilterTabsWidget({
    super.key,
    required this.selectedPhase,
    required this.onPhaseSelected,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    List<Map<String, dynamic>> phases = [
      {'id': 0, 'label': loc.translate('allPhases')},
      {'id': 1, 'label': 'Phase 1: Core'},
      {'id': 2, 'label': 'Phase 2: Advanced'},
      {'id': 3, 'label': 'Phase 3: Professional'},
      {'id': 4, 'label': 'Phase 4: Production'},
      {'id': 5, 'label': 'Phase 5: Extras'},
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: phases.length,
        itemBuilder: (context, index) {
          var item = phases[index];
          int pId = item['id'];
          bool isSelected = selectedPhase == pId;

          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                item['label'],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                ),
              ),
              selected: isSelected,
              selectedColor: theme.primaryColor,
              backgroundColor: theme.colorScheme.surface,
              onSelected: (bool sel) {
                if (sel) onPhaseSelected(pId);
              },
            ),
          );
        },
      ),
    );
  }
}
