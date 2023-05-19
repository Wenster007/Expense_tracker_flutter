import 'package:flutter/material.dart';

import '../../model/expense.dart';

class TotalItem extends StatelessWidget {
  final Expense expense;
  const TotalItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Text("${expense.amount}");
  }
}
