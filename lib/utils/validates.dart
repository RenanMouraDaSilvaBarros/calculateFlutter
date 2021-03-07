import 'package:calculate/constants/operators.dart';

bool isOperation(String operation) {
  return OPERATORS.contains(operation);
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
  for (int i = 0; i < expression.length ; i++) {
    if (isOperation(expression[i])) qtd++;
  }
  if (qtd == 1 || isConfig(value)) {
    return true;
  } else {
    print("ERRO! operadores em excesso!");
    return false;
  }
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
  if (expressionIsNotEmpty(expression, value) && checkPrevious(expression, value) && onlyOperation(expression, value)) {
    return true;
  }

  return false;
}
