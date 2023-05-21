import 'package:flutter/material.dart';

class DisplayListOfExpenses extends StatelessWidget {

  final void Function () toggleExpenseList;
  final Widget mainContent;

  const DisplayListOfExpenses({Key? key, required this.toggleExpenseList, required this.mainContent}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                onPressed: toggleExpenseList,
                icon: const Icon(Icons.sort),
              ),
            ],
          ),
        ),
        Flexible(child: mainContent),
      ],
    );
  }
}
