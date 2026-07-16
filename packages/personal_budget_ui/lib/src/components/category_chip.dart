import 'package:flutter/material.dart';
import 'package:personal_budget_core/personal_budget_core.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onSelected,
  });

  final TransactionCategory category;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  String _getCategoryLabel() {
    switch (category) {
      case TransactionCategory.grocery:
        return 'Grocery';
      case TransactionCategory.dining:
        return 'Dining';
      case TransactionCategory.transport:
        return 'Transport';
      case TransactionCategory.utilities:
        return 'Utilities';
      case TransactionCategory.leisure:
        return 'Leisure';
    }
  }

  IconData _getCategoryIcon() {
    switch (category) {
      case TransactionCategory.grocery:
        return Icons.shopping_cart;
      case TransactionCategory.dining:
        return Icons.restaurant;
      case TransactionCategory.transport:
        return Icons.directions_car;
      case TransactionCategory.utilities:
        return Icons.bolt;
      case TransactionCategory.leisure:
        return Icons.movie;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Stitch-inspired custom styling for selection states
    final backgroundColor = isSelected 
        ? colorScheme.primaryContainer.withOpacity(0.15) 
        : colorScheme.surfaceContainerLowest;
    final borderColor = isSelected 
        ? colorScheme.primary 
        : colorScheme.outlineVariant.withOpacity(0.5);
    final textColor = isSelected 
        ? colorScheme.primary 
        : colorScheme.onSurface;
    final iconColor = isSelected 
        ? colorScheme.primary 
        : colorScheme.outline;

    return GestureDetector(
      onTap: () => onSelected(!isSelected),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.01),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getCategoryIcon(),
              size: 20,
              color: iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              _getCategoryLabel(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: textColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


