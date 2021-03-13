import 'dart:core';
import 'package:calculate/componets/digit_button.dart';
import 'package:calculate/constants/operators.dart';
import 'package:calculate/models/calculateModel.dart';
import 'package:calculate/utils/business_rule.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expressionDisplay = "";
  String _firstOperating = "";
  String _secondOperating = "";
  String _option = "";
  String operator = "";
  CalculateModel calculate = CalculateModel();

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
                    update(value);
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

  void updatefirstOperating(String value) => setState(() {
        _firstOperating += value;
        _expressionDisplay = "$_firstOperating$_option$_secondOperating";
      });

  void updateOption(String value) => setState(() {
        _option = value;
        _expressionDisplay = "$_firstOperating$_option$_secondOperating";
      });

  void updateSecondOperating(String value) => setState(() {
        _secondOperating += value;
        _expressionDisplay = "$_firstOperating$_option$_secondOperating";
      });

  void clear() => setState(() {
        _firstOperating = "";
        _secondOperating = "";
        _option = "";
        _expressionDisplay = "";
      });

  void clearValue() {
    _firstOperating = "";
    _secondOperating = "";
    _option = "";
    _expressionDisplay = "";
  }

  void _result() {
    var cache;
    if (_firstOperating.isNotEmpty &&
        _option.isNotEmpty &&
        _secondOperating.isNotEmpty) {

      setState(() {
        _expressionDisplay =
            calculate.intelligent(_option, _firstOperating, _secondOperating);
        cache = _expressionDisplay;
      });

      clearValue();
      _firstOperating = formactDecimal(cache);
      _expressionDisplay = "$_firstOperating$_option$_secondOperating";
    }
  }

  void update(String value) {
    switch (value) {
      case "AC":
        clear();
        break;
      case "=":
        _result();
        break;
      default:
        operation(value);
        break;
    }
  }

  void operation(String value) {
    //atualiza o operador (-,+, *, /)
    if (!isConfig(value) &&
        isOperation(value) &&
        firstOperatingIsValid(_firstOperating)) {
      updateOption(value);
    } else if (firstOperatingIsValid(_firstOperating + value) &&
        _option.isEmpty) {
      //atualiza o primeiro operador

      updatefirstOperating(value);
    } else if (_option.isNotEmpty) {
      //atualiza o segundo operador
      updateSecondOperating(value);
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
