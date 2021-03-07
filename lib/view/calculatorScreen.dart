import 'dart:ffi';

import 'package:calculate/componets/digit_button.dart';
import 'package:calculate/utils/validates.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<String> _expression = [];
  String _expressionDisplay = "";
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
                    if (operationIsAllowed(_expressionDisplay, value)) {
                      setState(() {
                        direct(value);
                      });
                    }
                  },
                )
              : DigitButton(
                  color: Colors.grey.withOpacity(0.6),
                  number: numbers[e],
                  onChanged: (value) {
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

  void addExpression(String value) {
    _expression.add(value);
    _expressionDisplay += value;
  }

  void clear() {
    print("limpando....");
    setState(() {
      oparationsIsDisable = true;
      _expression = [];
      _expressionDisplay = "";
    });
  }

  void calculate(String expression) {
    print("calcular: $expression");
  }

  void direct(String option) {
    switch (option) {
      case 'AC':
        clear();
        break;
      case '=':
        //se tiver valido
        calculate(option);
        break;
      default:
        //se tiver valido
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
    print(" expressão: $_expressionDisplay");
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
                height: 180,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0.8),
                      child: Text(
                        _expressionDisplay,
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
