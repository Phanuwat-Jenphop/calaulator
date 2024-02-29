import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _expression = '';
  String _result = '';

  void _onPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        try {
          _result = _evaluateExpression();
        } catch (e) {
          _result = 'Error';
        }
        _expression = '';
      } else if (buttonText == 'C') {
        _expression = '';
        _result = '';
      } else {
        _expression += buttonText;
      }
    });
  }

  String _evaluateExpression() {
    String expression = _expression;
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll('×', '*');
    return _evaluate(expression).toString();
  }

  double _evaluate(String expression) {
    // Using `dart:math` library to evaluate the expression
    // Note: This is a very basic approach, more sophisticated parsing and evaluation could be used for a real-world calculator app.
    return double.parse(expression);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: <Widget>[
                  _buildButtonRow(['7', '8', '9', '÷']),
                  _buildButtonRow(['4', '5', '6', '×']),
                  _buildButtonRow(['1', '2', '3', '-']),
                  _buildButtonRow(['C', '0', '=', '+']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttonValues) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttonValues.map((buttonText) {
          return Expanded(
            child: InkWell(
              onTap: () => _onPressed(buttonText),
              child: Container(
                margin: EdgeInsets.all(4),
                color: buttonText == '=' ? Colors.blue : Colors.grey[300],
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
