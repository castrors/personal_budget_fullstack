import 'package:flutter/material.dart';
import 'package:personal_budget_core/personal_budget_core.dart';
import 'package:personal_budget_ui/personal_budget_ui.dart';
import 'src/screens/dashboard_screen.dart';
import 'src/screens/transactions_screen.dart';
import 'src/screens/add_transaction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Manager',
      theme: BudgetTheme.light,
      darkTheme: BudgetTheme.dark,
      themeMode: ThemeMode.light, // Locked to light as per prototype class="light"
      home: const MainNavigationShell(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;
  
  // Base balance baseline to match prototype values
  final double _baseBalance = 8000.00;

  // State containing the transactions list seeded with prototype data
  late List<Transaction> _transactions;

  @override
  void initState() {
    super.initState();
    _transactions = [
      Transaction(
        id: '1',
        title: 'Aluguel Apartamento',
        amount: 2500.00,
        date: DateTime.now().subtract(const Duration(days: 1)),
        category: TransactionCategory.utilities,
        type: TransactionType.expense,
      ),
      Transaction(
        id: '2',
        title: 'Supermercado Pão de Açúcar',
        amount: 450.20,
        date: DateTime.now().subtract(const Duration(days: 2)),
        category: TransactionCategory.grocery,
        type: TransactionType.expense,
      ),
      Transaction(
        id: '3',
        title: 'Leisure & Drinks',
        amount: 799.00,
        date: DateTime.now().subtract(const Duration(days: 2)),
        category: TransactionCategory.leisure,
        type: TransactionType.expense,
      ),
      Transaction(
        id: '4',
        title: 'Salário Mensal',
        amount: 8200.00,
        date: DateTime.now().subtract(const Duration(days: 4)),
        category: TransactionCategory.utilities,
        type: TransactionType.income,
      ),
    ];
  }

  // Calculations for dashboard totals
  double get _totalIncome {
    return _transactions
        .where((tx) => tx.type == TransactionType.income)
        .fold(0.0, (sum, tx) => sum + tx.amount);
  }

  double get _totalExpense {
    return _transactions
        .where((tx) => tx.type == TransactionType.expense)
        .fold(0.0, (sum, tx) => sum + tx.amount);
  }

  double get _totalBalance {
    return _baseBalance + _totalIncome - _totalExpense;
  }

  void _addTransaction(Transaction tx) {
    setState(() {
      _transactions.insert(0, tx);
    });
  }

  void _openAddTransactionModal() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTransactionScreen(
          onSave: (newTx) {
            _addTransaction(newTx);
            Navigator.of(context).pop();
            // Automatically navigate to history tab so they can see it added
            setState(() {
              _currentIndex = 1;
            });
          },
        ),
        fullscreenDialog: true,
      ),
    );
  }

  Widget _buildMockScreen(String title, IconData icon) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: theme.colorScheme.primary.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text(
              'Tela de $title em desenvolvimento',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardScreen(
        balance: _totalBalance,
        income: _totalIncome,
        expense: _totalExpense,
        recentTransactions: _transactions,
        onAddTransaction: _openAddTransactionModal,
        onViewAllTransactions: () {
          setState(() {
            _currentIndex = 1;
          });
        },
      ),
      TransactionsScreen(
        transactions: _transactions,
      ),
      const SizedBox.shrink(), // Add button (opens modal, placeholder in list)
      _buildMockScreen('Relatórios', Icons.insights),
      _buildMockScreen('Configurações', Icons.settings),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            _openAddTransactionModal();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
