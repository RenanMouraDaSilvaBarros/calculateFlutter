import 'package:calculate/constants/operators.dart';

bool isOperation(String operation) {
  return OPERATORS.contains(operation);
}

bool onlyOperation(String expression) {
  int qtd = 0;
  for (int i = 0; i < expression.length; i++) {
    if (isOperation(expression[i])) qtd++;
  }
  return qtd == 1;
}




