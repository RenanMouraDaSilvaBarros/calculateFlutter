import 'package:flutter/foundation.dart';

class CalculateModel {
  double sum(double numberOne, double numberTwo) => numberOne + numberTwo;

  double subtract(double numberOne, double numberTwo) => numberOne - numberTwo;

  double multiply(double numberOne, double numberTwo) => numberOne * numberTwo;

  double divide(double numberOne, double numberTwo) {
    try {
      return numberOne / numberTwo;
    } on IntegerDivisionByZeroException {
      debugPrint("Cannot divide by zero");
    }
  }

  String intelligent(String operation, String numberOne, String numberTwo) {
    double _numberOne = double.parse(numberOne);
    double _numberTwo = double.parse(numberTwo);
    switch (operation) {
      case '+':
        return sum(_numberOne, _numberTwo).toStringAsFixed(1);
        break;
      case '-':
        return subtract(_numberOne, _numberTwo).toStringAsFixed(1);
        break;
      case 'x':
        return multiply(_numberOne, _numberTwo).toStringAsFixed(1);
        break;
      case '/':
        return divide(_numberOne, _numberTwo).toStringAsFixed(1);
        break;
    }
  }
}
