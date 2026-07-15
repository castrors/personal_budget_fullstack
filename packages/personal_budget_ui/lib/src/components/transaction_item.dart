import 'package:flutter/material.dart';
import 'package:personal_budget_core/personal_budget_core.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    this.onTap,
    this.currencySymbol = 'R\$',
  });

  final Transaction transaction;
  final VoidCallback? onTap;
  final String currencySymbol;

  IconData _getIconData() {
    switch (transaction.category) {
      case TransactionCategory.grocery:
        return Icons.shopping_basket;
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

  Color _getIconBackgroundColor(ColorScheme colorScheme) {
    if (transaction.type == TransactionType.income) {
      return colorScheme.secondaryContainer.withOpacity(0.3);
    }
    switch (transaction.category) {
      case TransactionCategory.grocery:
        return colorScheme.primaryContainer.withOpacity(0.15);
      case TransactionCategory.dining:
        return colorScheme.errorContainer.withOpacity(0.2);
      case TransactionCategory.transport:
        return colorScheme.surfaceContainerHighest;
      case TransactionCategory.utilities:
        return const Color(0xFFFFF9C4); // Light yellow
      case TransactionCategory.leisure:
        return colorScheme.surfaceContainerHighest;
    }
  }

  Color _getIconColor(ColorScheme colorScheme) {
    if (transaction.type == TransactionType.income) {
      return colorScheme.onSecondaryContainer;
    }
    switch (transaction.category) {
      case TransactionCategory.grocery:
        return colorScheme.primary;
      case TransactionCategory.dining:
        return colorScheme.error;
      case TransactionCategory.transport:
        return colorScheme.onSurfaceVariant;
      case TransactionCategory.utilities:
        return Colors.orange;
      case TransactionCategory.leisure:
        return colorScheme.onSurfaceVariant;
    }
  }

  String _formatAmount() {
    final prefix = transaction.type == TransactionType.income ? '+' : '-';
    final parts = transaction.amount.toStringAsFixed(2).split('.');
    final integer = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
    final decimal = parts[1];
    return '$prefix $currencySymbol $integer,$decimal';
  }

  String _formatDate() {
    // Simple mock date formatter for portuguese display
    final date = transaction.date;
    final months = [
      'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
      'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'
    ];
    final day = date.day.toString().padLeft(2, '0');
    final month = months[date.month - 1];
    final year = date.year;
    return '$day $month $year';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isIncome = transaction.type == TransactionType.income;
    final amountColor = isIncome ? colorScheme.onSecondaryContainer : colorScheme.error;

    return Material(
      color: colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getIconBackgroundColor(colorScheme),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIconData(),
                  color: _getIconColor(colorScheme),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Text(
                _formatAmount(),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: amountColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default',
  type: TransactionItem,
)
Widget buildTransactionItemUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        TransactionItem(
          transaction: Transaction(
            id: '1',
            title: 'Salário Mensal',
            amount: 8200.00,
            date: DateTime(2023, 10, 5),
            category: TransactionCategory.utilities, // Represented as cash here
            type: TransactionType.income,
          ),
          onTap: () {},
        ),
        const SizedBox(height: 8),
        TransactionItem(
          transaction: Transaction(
            id: '2',
            title: 'Supermercado Pão de Açúcar',
            amount: 450.20,
            date: DateTime(2023, 10, 8),
            category: TransactionCategory.grocery,
            type: TransactionType.expense,
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}
