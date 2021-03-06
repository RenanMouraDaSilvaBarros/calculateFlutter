import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  final String number;
  final Color color;

  const DigitButton({Key key, this.number, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 40,
      child: Text(number, style: TextStyle(fontSize: 40)),
    );
  }
}
