import 'package:flutter/material.dart';

class UnderlinedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool currentState;

  UnderlinedButton({required this.onPressed, required this.text, required this.currentState});

  @override
  _UnderlinedButtonState createState() => _UnderlinedButtonState();
}

class _UnderlinedButtonState extends State<UnderlinedButton> {
  late bool _isButtonActive;

  @override
  void initState() {
    _isButtonActive = widget.currentState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isButtonActive = !_isButtonActive;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isButtonActive = false;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: _isButtonActive
              ? LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    Theme.of(context).colorScheme.primary.withOpacity(0.0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
              : const LinearGradient(
                  colors: [
                    Colors.white,Colors.white
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
          border: Border(
            bottom: BorderSide(
              color: _isButtonActive
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.7)
                  : Colors.black,
              width: 4.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
