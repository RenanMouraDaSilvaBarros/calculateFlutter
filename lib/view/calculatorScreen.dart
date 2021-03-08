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
                    if (operationIsAllowed(_expressionDisplay, value)) {
                      setState(() {
                        _direct(value);
                        if (isOperation(value)) {
                          _disableNumber = false;
                        }
                      });
                    }
                  },
                )
              : DigitButton(
                  color: Colors.grey.withOpacity(0.6),
                  number: numbers[e],
                  onChanged: (value) {
                    print("você digitou : $value");
                    if (!_disableNumber) {
                      setState(() {
                        _direct(value);
                      });
                    } else {
                      print("números desabilitado!");
                    }
                  },
                );
        },
      ),
    );
  }

  void _addExpression(String value) {
    _expressionDisplay += value;
  }

  void _clear() {
    print("limpando....");
    setState(() {
      _expressionDisplay = "";
      _disableNumber = false;
    });
  }

  void _calculate() {
    print("calcular: $_expressionDisplay");
    CalculateModel _calculate = CalculateModel();
    String _operation = getOperation(_expressionDisplay);
    var _getNumbers = _expressionDisplay.split(_operation);
    print("${_getNumbers.first} $_operation ${_getNumbers.first}");
    setState(() {
      _expressionDisplay = _calculate.intelligent(
          _operation, _getNumbers.first, _getNumbers.last);
      _disableNumber = true;
    });
  }

  void _direct(String option) {
    switch (option) {
      case 'AC':
        _clear();
        break;
      case '=':
        _calculate();
        break;
      default:
        _addExpression(option);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 3),
                width: double.infinity,
                height:MediaQuery.of(context).size.height * 0.33,
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
