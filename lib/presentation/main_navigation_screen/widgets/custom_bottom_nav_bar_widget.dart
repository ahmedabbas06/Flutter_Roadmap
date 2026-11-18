import 'package:flutter/material.dart';

class CustomNavItemData {
  String label;
  IconData icon;
  IconData activeIcon;

  CustomNavItemData({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}

class CustomBottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<CustomNavItemData> items;

  CustomBottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
            width: 1.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              CustomNavItemData item = items[index];
              bool isSelected = currentIndex == index;

              return InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(16),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.symmetric(
                    horizontal: isSelected ? 16 : 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.primaryColor.withValues(alpha: 0.14)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      AnimatedScale(
                        scale: isSelected ? 1.1 : 1.0,
                        duration: Duration(milliseconds: 200),
                        child: Icon(
                          isSelected ? item.activeIcon : item.icon,
                          color: isSelected
                              ? theme.primaryColor
                              : theme.colorScheme.onSurfaceVariant,
                          size: 22,
                        ),
                      ),
                      if (isSelected) ...[
                        SizedBox(width: 8),
                        AnimatedOpacity(
                          opacity: isSelected ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
