import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class BudgetButton extends StatelessWidget {
  const BudgetButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label),
    );
  }
}

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
