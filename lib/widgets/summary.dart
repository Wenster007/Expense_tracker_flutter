import 'package:flutter/material.dart';
import 'package:expense_tracker2/widgets/total/total_item.dart';
import 'package:expense_tracker2/model/expense.dart';

class Summary extends StatelessWidget {
  final List<Expense> totalExpense;
  const Summary({Key? key, required this.totalExpense}) : super(key: key);


  //to calculate expenses done in one day.
  double getDayExpense(List<Expense> expenses) {
    double sum = 0;
    DateTime currentDate = DateTime.now();
    DateTime particularDateOfExpense;
    Duration difference;

    for (var expense in expenses) {
      particularDateOfExpense= expense.date;
      difference = currentDate.difference(particularDateOfExpense);

      if (difference.inDays <= 1) {
        sum = sum + expense.amount;
      }
    }
    return sum;
  }


  //to calculate expenses done in a week
  double getWeekExpense(List<Expense> expenses) {
    double sum = 0;
    DateTime currentDate = DateTime.now();
    DateTime particularDateOfExpense;
    Duration difference;

    for (var expense in expenses) {
      particularDateOfExpense= expense.date;
      difference = currentDate.difference(particularDateOfExpense);

      if (difference.inDays <= 7) {
        sum = sum + expense.amount;
      }
    }
    return sum;
  }

  //to calculate expense done in a year
  double getYearExpense(List<Expense> expenses) {
    double sum = 0;
    DateTime currentDate = DateTime.now();
    DateTime particularDateOfExpense;
    Duration difference;

    for (var expense in expenses) {
      particularDateOfExpense= expense.date;
      difference = currentDate.difference(particularDateOfExpense);

      if (difference.inDays <= 365) {
        sum = sum + expense.amount;
      }
    }
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 4, horizontal: 16),
        child: Column(
          children: [
            Text("Expenses",
                style:
                Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer)),
            const SizedBox(
              height: 20,
            ),
            TotalItem(durationOfExpense: "Daily Expense", totalDurationExpense: getDayExpense, expenses: totalExpense),
            TotalItem(durationOfExpense: "Weekly Expense", totalDurationExpense: getWeekExpense, expenses: totalExpense),
            TotalItem(durationOfExpense: "Yearly Expense", totalDurationExpense: getYearExpense, expenses: totalExpense),
          ],
        ),
      ),
    );
  }
}
