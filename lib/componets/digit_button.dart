import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  final String number;
  final Color color;
  final size;
  final ValueChanged<String> onChanged;

  const DigitButton({Key key, this.number, this.color, this.onChanged, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onChanged != null) onChanged(number);
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: size??34,
        child: Text(number, style: TextStyle(fontSize: 40, color: Colors.white)),
      ),
    );
  }
}
