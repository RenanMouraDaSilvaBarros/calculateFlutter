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
    Widget _row({List<String> numbers, List<String> operator}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          numbers.length + operator.length,
          (e) {
            print(e);
            print("size: ${numbers.length}");
            return e >= numbers.length
                ? DigitButton(
                    color: Colors.yellow,
                    number: operator[e - numbers.length],
                     onChanged: (value) {
                      print("você digitou : $value");
                    },
                  )
                : DigitButton(
                    color: Colors.yellow,
                    number: numbers[e],
                    onChanged: (value) {
                      print("você digitou : $value");
                    },
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
            _row(numbers: ['1', '2', '3'], operator: ['+']),
            _row(numbers: ['4', '5', '6'], operator: ['-']),
            _row(numbers: ['7', '8', '9'], operator: ['x']),
            _row(numbers: ['0'], operator: ['AC', '=', '/'])
          ],
        ),
      ),
    );
  }
}
