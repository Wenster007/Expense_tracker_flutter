import 'package:expense_tracker2/widgets/total/total_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker2/model/expense.dart';



class TotalList extends StatelessWidget {
  final List<Expense> expenses;
  const TotalList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length, itemBuilder: (ctx, index) => TotalItem(expense: expenses[index]),);
  }
}
