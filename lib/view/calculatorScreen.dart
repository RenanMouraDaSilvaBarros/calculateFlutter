import 'dart:ffi';

import 'package:calculate/componets/digit_button.dart';
import 'package:calculate/constants/operators.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _opration = "";

  Widget _row({List<String> numbers, List<String> operator}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        numbers.length + operator.length,
        (e) {
          return e >= numbers.length
              ? DigitButton(
                  color: Colors.orange,
                  number: operator[e - numbers.length],
                  onChanged: (value) {
                    print("você digitou : $value");
                    setState(() {
                      if (isOperatorValidate()) {
                        expression(value);
                        direct(value);
                      }
                    });
                  },
                )
              : DigitButton(
                  color: Colors.grey.withOpacity(0.6),
                  number: numbers[e],
                  onChanged: (value) {
                    print("você digitou : $value");
                    setState(() {
                      expression(value);
                    });
                  },
                );
        },
      ),
    );
  }

  bool isOperatorValidate() {
    if (_opration.length > 0) {
      print("anterior: ${_opration[_opration.length - 1]}");
      String previous = _opration[_opration.length - 1];
      if (OPERATORS.contains(previous)) {
        return false;
      }
    }
    return true;
  }

  void expression(String value) {
    _opration += value;
  }

  void clear() {
    setState(() {
      _opration = "";
    });
  }

  void calculate(String option){

  }

  void direct(String option) {
    switch (option) {
      case 'AC':
        clear();
        break;
      case '=':
      calculate(option);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const SPACE = SizedBox(height: 5);
    print(" opa$_opration");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                //  color: Colors.red,
                width: double.infinity,
                height: 200,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0.8),
                      child: Text(
                        _opration,
                        style: TextStyle(fontSize: 70, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              _row(numbers: ['1', '2', '3'], operator: ['+']),
              SPACE,
              _row(numbers: ['4', '5', '6'], operator: ['-']),
              SPACE,
              _row(numbers: ['7', '8', '9'], operator: ['x']),
              SPACE,
              _row(numbers: ['0'], operator: ['AC', '=', '/']),
            ],
          ),
        ),
      ),
    );
  }
}
