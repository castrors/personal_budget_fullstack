import 'package:personal_budget_core/personal_budget_core.dart';

void main() {
  final transaction = Transaction(
    id: '1',
    title: 'Supermarket',
    amount: 150.0,
    date: DateTime.now(),
    category: TransactionCategory.grocery,
    type: TransactionType.expense,
  );
  print('Transaction title: ${transaction.title}, amount: ${transaction.amount}');
}
