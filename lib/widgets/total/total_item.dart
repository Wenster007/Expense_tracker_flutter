import 'package:flutter/material.dart';

import '../../model/expense.dart';

class TotalItem extends StatelessWidget {
  final double Function (List<Expense>) totalDurationExpense;
  final List<Expense> expenses;
  final String durationOfExpense;
  const TotalItem(
      {super.key,  required this.durationOfExpense, required this.totalDurationExpense, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(durationOfExpense, style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 16, // Set the desired font size
            color: Theme.of(context).colorScheme.onPrimaryContainer,),),
              const SizedBox(
                height: 25,
              ),
              Text(totalDurationExpense(expenses).toStringAsFixed(2), style: const TextStyle(color: Colors.black, fontSize: 20,),),
            ],
          ),
        ),
      ),
    );
  }
}
