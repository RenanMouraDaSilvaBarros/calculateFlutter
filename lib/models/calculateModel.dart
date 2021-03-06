import 'package:flutter/foundation.dart';

class CalculateModel {
  double sum({double numberOne, double numberTwo}) => numberOne + numberTwo;

  double subtract({double numberOne, double numberTwo}) => numberOne - numberTwo;

  double multiply({double numberOne, double numberTwo}) =>
      numberOne * numberTwo;

  double divide({double numberOne, double numberTwo}) {
    try {
      return numberOne / numberTwo;
    } on IntegerDivisionByZeroException {
      debugPrint("Cannot divide by zero");
    }
  }
}
