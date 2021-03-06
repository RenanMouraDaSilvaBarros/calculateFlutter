import 'dart:ffi';

import 'package:calculate/componets/digit_button.dart';
import 'package:calculate/constants/operators.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = "";
  bool oparationsIsDisable = true;

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
                    if (!oparationsIsDisable) {
                      print("você digitou : $value");
                      if (expressionIsValid(value)) {
                        setState(() {
                          direct(value);
                        });
                      }
                    }
                  },
                )
              : DigitButton(
                  color: Colors.grey.withOpacity(0.6),
                  number: numbers[e],
                  onChanged: (value) {
                    oparationsIsDisable = false;
                    print("você digitou : $value");
                    setState(() {
                      direct(value);
                    });
                  },
                );
        },
      ),
    );
  }

  bool checkPrevious(String value) {
    print("validando anteriores");
    if (_expression.length > 0) {
      String previous = _expression[_expression.length - 1];
      String current = value;

      if (OPERATORS.contains(previous) && current != 'AC' && current != '=') {
        print("invalida");
        return false;
      }
    }
    print("validando anteriores: valida");
    print("-------------");
    return true;
  }

  bool expressionIsValid(String value) {
    if (checkPrevious(value)) {
      return true;
    }
    return false;
  }

  void addExpression(String value) {
    _expression += value;
  }

  void clear() {
    print("limpando....");
    setState(() {
      oparationsIsDisable = true;
      _expression = "";
    });
  }

  void calculate(String expression) {
    print("calcular: expression");
  }

  void direct(String option) {
    switch (option) {
      case 'AC':
        clear();
        break;
      case '=':
        calculate(option);
        break;
      default:
        addExpression(option);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const SPACE = SizedBox(height: 5);
    print(" expressão: $_expression");
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
                        _expression,
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
