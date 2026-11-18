import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class ProjectsFilterWidget extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final ValueChanged<String> onSearchChanged;

  ProjectsFilterWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;

    List<String> filters = ['All', 'In Progress', 'Completed', 'Not Started'];

    return Column(
      children: [
        TextField(
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: loc.translate('search'),
            prefixIcon: Icon(Icons.search, size: 20),
            isDense: true,
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              String f = filters[index];
              bool isSelected = selectedFilter == f;

              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(
                    f,
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
                    if (sel) onFilterChanged(f);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
