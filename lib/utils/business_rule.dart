import 'package:calculate/constants/operators.dart';
import 'package:calculate/models/calculateModel.dart';

bool isOperation(String operation) {
  return OPERATORS.contains(operation);
}

bool hasOperation(String expression) {
  for (int i = 0; i < expression.length; i++) {
    if (isOperation(expression[i])) {
      return true;
    }
  }
  return false;
}

bool isConfig(String operation) {
  return CONFIG.contains(operation);
}

bool expressionIsNotEmpty(String expression, String value) {
  if (expression.isNotEmpty) {
    return true;
  } else {
    print("ERRO carectere bloqueado $value");
    return false;
  }
}

bool onlyOperation(String expression, String value) {
  int qtd = 0;
  expression += value;

  print(expression);
  for (int i = 0; i < expression.length; i++) {
    if (isOperation(expression[i])) qtd++;
  }
  if (qtd == 1 || value == 'AC') {
    return true;
  } else if (value == '=') {
    print("ERRO! formato invalido!");
  } else {
    print("ERRO! operadores em excesso!");
  }
  return false;
}

bool checkPrevious(String expression, String value) {
  var last = expression[expression.length - 1];
  //anterior é operador
  if (isOperation(last) && value != 'AC') {
    print("ERRO anterior é um operador $value");
    return false;
  }
  return true;
}

bool operationIsAllowed(String expression, String value) {
  if (expressionIsNotEmpty(expression, value) &&
      checkPrevious(expression, value) &&
      onlyOperation(expression, value)) {
    return true;
  }

  return false;
}

String getOperation(String expression) {
  for (int i = 0; i < expression.length; i++) {
    if (isOperation(expression[i]) &&
        !isOperation(expression[i - 1]) &&
        !isOperation(expression[i + 1])) return expression[i];
  }

  return "ERRO";
}

String formactDecimal(String expression) {
  int point = expression.indexOf('.');

  if (point != -1) {
    String next = expression[point + 1];
    if (next == '0') {
      return expression.substring(0, point);
    }
  }
  return expression;
}

bool isNegative(String number) {
  if (number.length == 2 && number[0] == '-') {
    return true;
  }
  return false;
}

bool isFormact(String expression) {
  if (expression.length >= 3 || expression.length <= 5) {
    for (int i = 0; i < expression.length; i++) {
      if (isOperation(expression[i]) &&
          !isOperation(expression[i - 1]) &&
          !isOperation(expression[i + 1])) {
        return true;
      }
    }
  }

  return false;
}

String calculate(String espression) {
  CalculateModel _calculate = CalculateModel();
  String operation = getOperation(espression);

  if (isFormact(operation)) {
    var _getNumbers = espression.split(operation);
    print("${_getNumbers.first} $operation ${_getNumbers.first}");
    espression =
        _calculate.intelligent(operation, _getNumbers.first, _getNumbers.last);

    print("espression: $espression");
    return espression = formactDecimal(espression);
  }
  return "ERRO";
}

//news
//validar primeiro operador
bool firstOperatingIsValid(String value) {
  //
  try {
    double.parse(value);
    return true;
  } catch (e) {
    if (value == "-") {
      return true;
    }
    print("ERRO entrada($value) invalida");
    return false;
  }
}

bool lastOperatingIsValid(String value) {
  //
  try {
    double.parse(value);
    return true;
  } catch (e) {
    print("ERRO entrada($value) invalida");
    return false;
  }
}


