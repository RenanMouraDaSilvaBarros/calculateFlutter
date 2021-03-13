import 'dart:core';

import 'package:calculate/componets/digit_button.dart';
import 'package:calculate/constants/operators.dart';
import 'package:calculate/models/calculateModel.dart';
import 'package:calculate/utils/business_rule.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expressionDisplay = "";

  String firstOperating = "";
  String secondOperating = "";
  String option = "";

  String operator = "";

  bool _disableNumber = false;

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
                    print("voce digitou $value");

                    if (!isConfig(value) &&
                        isOperation(value) &&
                        firstOperatingIsValid(firstOperating)) {
                      updateOption(value);
                    } else {
                      update(value);
                    }
                  },
                )
              : DigitButton(
                  color: Colors.grey.withOpacity(0.6),
                  number: numbers[e],
                  onChanged: (value) {
                    print("voce $value");

                    update(value);
                  },
                );
        },
      ),
    );
  }

  void updatefirstOperating(String value) {
    print("primeiro");

    setState(() {
      firstOperating += value;
      _expressionDisplay = "$firstOperating$option$secondOperating";
    });
  }

  void updateOption(String value) {
    print("operador");
    setState(() {
      option = value;
      _expressionDisplay = "$firstOperating$option$secondOperating";
    });
  }

  void updatesecondOperating(String value) {
    print("terceiro");
    setState(() {
      secondOperating += value;
      _expressionDisplay = "$firstOperating$option$secondOperating";
    });
  }

  void clear() {
    setState(() {
      firstOperating = "";
      secondOperating = "";
      option = "";
      _expressionDisplay = "";
    });
  }


void result(){
  
}
//primeiro operador
  update(String value) {
    switch (value) {
      case "AC":
        clear();
        break;
      case "=":
        break;
      default:
        operation(value);
        break;
    }
  }

  void operation(String value) {
    if (firstOperatingIsValid(firstOperating + value) && option.isEmpty) {
      updatefirstOperating(value);
    } else if (option.isNotEmpty) {
      updatesecondOperating(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 3),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.33,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: const AlignmentDirectional(1, 0.1),
                      child: Text(
                        _expressionDisplay,
                        style: TextStyle(fontSize: 80, color: Colors.white),
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
