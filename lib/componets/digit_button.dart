import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  final String number;
  final Color color;

  final ValueChanged<String> onChanged;

  const DigitButton({Key key, this.number, this.color, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onChanged != null) onChanged(number);
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: MediaQuery.of(context).size.height * 0.054,
        child: Text(number, style: TextStyle(fontSize: 40, color: Colors.white)),
      ),
    );
  }
}
