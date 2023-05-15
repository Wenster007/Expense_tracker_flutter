import 'package:flutter/material.dart';
import 'package:expense_tracker2/model/expense.dart';
import 'package:expense_tracker2/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: const EdgeInsets.all(8),
        ),
        onDismissed: (direction) => removeExpense(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
