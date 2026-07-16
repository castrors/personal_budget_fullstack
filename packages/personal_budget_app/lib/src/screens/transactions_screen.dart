import 'package:flutter/material.dart';
import 'package:personal_budget_core/personal_budget_core.dart';
import 'package:personal_budget_ui/personal_budget_ui.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({
    super.key,
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Transaction> get _filteredTransactions {
    if (_searchQuery.isEmpty) {
      return widget.transactions;
    }
    return widget.transactions.where((tx) {
      final titleMatch = tx.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final descMatch = tx.description?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false;
      return titleMatch || descMatch;
    }).toList();
  }

  // Groups transactions by date header (e.g. Today, Yesterday, specific date)
  Map<String, List<Transaction>> _groupTransactions(List<Transaction> list) {
    final Map<String, List<Transaction>> grouped = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    for (final tx in list) {
      final txDate = DateTime(tx.date.year, tx.date.month, tx.date.day);
      String key;
      if (txDate == today) {
        key = 'Hoje';
      } else if (txDate == yesterday) {
        key = 'Ontem';
      } else {
        // Format as Oct 24, 2023 / 24 Out 2023
        final months = [
          'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
          'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'
        ];
        key = '${txDate.day.toString().padLeft(2, '0')} ${months[txDate.month - 1]} ${txDate.year}';
      }

      if (!grouped.containsKey(key)) {
        grouped[key] = [];
      }
      grouped[key]!.add(tx);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final filtered = _filteredTransactions;
    final grouped = _groupTransactions(filtered);
    final groupKeys = grouped.keys.toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.surfaceContainer,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Icon(
                          Icons.person,
                          color: BudgetTheme.primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Histórico',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: colorScheme.primary,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. Search Bar Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Filtros avançados não implementados')),
                    );
                  },
                ),
                hintText: 'Pesquisar transações...',
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),

          // 2. Transactions list grouped by date
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Text(
                      _searchQuery.isEmpty
                          ? 'Nenhuma transação cadastrada.'
                          : 'Nenhuma transação correspondente.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.outline,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: groupKeys.length,
                    itemBuilder: (context, keyIndex) {
                      final key = groupKeys[keyIndex];
                      final list = grouped[key]!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                            child: Text(
                              key.toUpperCase(),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.outline,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            separatorBuilder: (_, _) => const SizedBox(height: 8),
                            itemBuilder: (context, itemIndex) {
                              final tx = list[itemIndex];
                              return TransactionItem(
                                transaction: tx,
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Detalhes: ${tx.title}')),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
