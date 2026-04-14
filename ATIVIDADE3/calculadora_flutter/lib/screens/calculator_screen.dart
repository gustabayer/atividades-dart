import 'package:flutter/material.dart';
import '../controllers/calculator_logic.dart';
import '../widgets/calc_button.dart';
import '../widgets/calc_display.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final logic = CalculatorLogic();

  void onPressed(String value) {
    setState(() {
      if (value == 'C') {
        logic.limpar();
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        logic.selecionarOperador(value);
      } else if (value == '=') {
        logic.calcular();
      } else {
        logic.inserirNumero(value);
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: CalcButton(
        text: text,
        onTap: () => onPressed(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: CalcDisplay(text: logic.display),
          ),

          Row(children: [buildButton('7'), buildButton('8'), buildButton('9'), buildButton('/')]),
          Row(children: [buildButton('4'), buildButton('5'), buildButton('6'), buildButton('*')]),
          Row(children: [buildButton('1'), buildButton('2'), buildButton('3'), buildButton('-')]),
          Row(children: [buildButton('0'), buildButton('C'), buildButton('='), buildButton('+')]),
        ],
      ),
    );
  }
}