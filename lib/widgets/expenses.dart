import 'package:expense_tracker2/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker2/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker2/model/expense.dart';
import 'package:expense_tracker2/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 15,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  List<Expense> _currentActiveExpenseList = [];

  _ExpensesState() {
    _currentActiveExpenseList = _registeredExpenses;
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      _addSortedExpense(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(_addExpense);
        });
  }

  void _removeExpense(Expense expense) {
    int expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
      _removeSortedExpense(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  List<Expense> get _sortedExpenseList {
    final List<Expense> sortedExpenseAscendingList =
        List.from(_registeredExpenses);

    sortedExpenseAscendingList.sort((a, b) => a.date.compareTo(b.date));

    return sortedExpenseAscendingList;
  }

  void _addSortedExpense(Expense expense) {
    if (_currentActiveExpenseList != _registeredExpenses) {
      _currentActiveExpenseList = _sortedExpenseList;
    }
  }

  void _removeSortedExpense(Expense expense) {
    if (_currentActiveExpenseList != _registeredExpenses) {
      _currentActiveExpenseList = _sortedExpenseList;
    }
  }

  void _toggleExpenseList() {
    setState(() {
      if (_currentActiveExpenseList == _registeredExpenses) {
        _currentActiveExpenseList = _sortedExpenseList;

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sorted In Date Order"),
            duration: Duration(seconds: 4),
          ),
        );
      } else {
        _currentActiveExpenseList = _registeredExpenses;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No Expenses Found!"));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _currentActiveExpenseList,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: _toggleExpenseList,
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
