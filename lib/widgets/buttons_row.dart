import 'package:flutter/material.dart';


class ButtonRow extends StatefulWidget {

  final void Function () onExpenseClick;
  final void Function () onSummaryClick;

  const ButtonRow({Key? key, required this.onExpenseClick, required this.onSummaryClick}) : super(key: key);

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14,right: 14, top: 4, bottom: 0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(onPressed: widget.onExpenseClick, child: const Text("Expenses"),),
          ),
          Expanded(child: ElevatedButton(onPressed: widget.onSummaryClick, child: const Text("Summary"),),)
        ],
      ),
    );
  }
}
