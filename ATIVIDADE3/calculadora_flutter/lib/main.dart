class CalculatorLogic {
  String display = '0';

  double num1 = 0;
  double num2 = 0;
  String operador = '';

  void inserirNumero(String numero) {
    if (display == '0') {
      display = numero;
    } else {
      display += numero;
    }
  }

  void selecionarOperador(String op) {
    num1 = double.parse(display);
    operador = op;
    display = '0';
  }

  void calcular() {
    num2 = double.parse(display);

    double resultado = 0;

    switch (operador) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '':
        resultado = num1 num2;
        break;
      case '/':
        resultado = num2 != 0 ? num1 / num2 : 0;
        break;
    }

    display = resultado.toString();
  }

  void limpar() {
    display = '0';
    num1 = 0;
    num2 = 0;
    operador = '';
  }
}