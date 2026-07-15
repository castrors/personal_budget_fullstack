enum TransactionCategory {
  grocery,
  dining,
  transport,
  utilities,
  leisure,
}

enum TransactionType {
  expense,
  income,
}

class Transaction {
  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
    this.description,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionCategory category;
  final TransactionType type;
  final String? description;

  Transaction copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
    TransactionCategory? category,
    TransactionType? type,
    String? description,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      type: type ?? this.type,
      description: description ?? this.description,
    );
  }
}
