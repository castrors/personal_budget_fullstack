import 'package:flutter/material.dart';
import 'package:personal_budget_core/personal_budget_core.dart';
import 'package:personal_budget_ui/personal_budget_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: BudgetButton,
)
Widget buildBudgetButtonUseCase(BuildContext context) {
  return Center(
    child: BudgetButton(
      label: 'Clique aqui',
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  type: BottomNavBar,
)
Widget buildBottomNavBarUseCase(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: BottomNavBar(
      currentIndex: 0,
      onTap: (_) {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  type: BudgetBalanceCard,
)
Widget buildBudgetBalanceCardUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: BudgetBalanceCard(
        balance: 12450.80,
        onAddPressed: () {},
        onTransferPressed: () {},
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  type: BudgetSplitCard,
)
Widget buildBudgetSplitCardUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: BudgetSplitCard(
        income: 8200.00,
        expense: 3749.20,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  type: CategoryChip,
)
Widget buildCategoryChipUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CategoryChip(
            category: TransactionCategory.grocery,
            isSelected: true,
            onSelected: (_) {},
          ),
          const SizedBox(width: 12),
          CategoryChip(
            category: TransactionCategory.dining,
            isSelected: false,
            onSelected: (_) {},
          ),
        ],
      ),
    ),
  );
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
            category: TransactionCategory.utilities,
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
