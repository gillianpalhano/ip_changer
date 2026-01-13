import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;
  final bool isDarkMode;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isExpanded,
    required this.onTap,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withAlpha(80)
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Tooltip(
          message: isExpanded ? '' : label,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isDarkMode ? Colors.white70 : Colors.black54,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
              if (isExpanded) const SizedBox(width: 12),
              if (isExpanded)
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
