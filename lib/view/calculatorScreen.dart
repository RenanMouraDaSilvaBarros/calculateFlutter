import 'package:calculate/componets/digit_button.dart';
import 'package:calculate/constants/operators.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _rowOne({List<String> numbers, String operator}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          numbers.length + 1,
          (e) {
            print(e);
            print("size: ${numbers.length}");
            return e == numbers.length
                ? DigitButton(
                    color: Colors.yellow,
                    number: operator,
                  )
                : DigitButton(
                    color: Colors.yellow,
                    number: numbers[e],
                  );
          },
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: 200,
            ),
            _rowOne(numbers: ['1', '2', '3'], operator: '+'),
            _rowOne(numbers: ['4', '5', '6'], operator: '-'),
            _rowOne(numbers: ['7', '8', '9'], operator: 'x'),
            _rowOne(numbers: ['0'], operator: '/')
          ],
        ),
      ),
    );
  }
}
