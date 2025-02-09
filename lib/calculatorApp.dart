import 'package:flutter/material.dart';
import 'package:hello_world/widget/calculatorButton.dart';

class Calculatorapp extends StatefulWidget {
  const Calculatorapp({super.key});

  @override
  State<Calculatorapp> createState() => _CalculatorappState();
}

class _CalculatorappState extends State<Calculatorapp> {
  String _output = '0';
  String _input = '';
  String operand = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String value){
    print(value);
    setState((){
      if(value =='C'){
        _output = '0';
         _input = '';
         operand = '';
         num1 = 0;
         num2 = 0;
      }else if( value == "="){
        num2 = double.parse(_input);
        if(operand == '+'){
          _output = (num1+num2).toString();
        }else if(operand == '-'){
          _output = (num1-num2).toString();
        }else if(operand == '×'){
          _output = (num1*num2).toString();
        }else if(operand == '÷'){
          _output  = (num2 != 0) ? (num1 / num2).toString() : 'Error';
        }
        _input = _output;

      }else if(['+','-','×','÷'].contains(value)){
        num1 = double.parse(_input);
        operand = value;
        _input = '';
      }else{
        _input += value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator "),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
         Expanded(
           child: Container(
             alignment: Alignment.bottomRight,
             padding: EdgeInsets.all(24),
             child: Text(_output,
               style: TextStyle(
                 fontSize: 50,
                 fontWeight: FontWeight.bold,
                 color: Colors.white
               ),),
           ),
         ),
          Row(
            children: [
              buildButton(text: '7', onClick: () => buttonPressed('7'),),
              buildButton(text: '8',onClick: () => buttonPressed('8'),),
              buildButton(text: '9',onClick: () => buttonPressed('9'),),
              buildButton(text: '÷' , onClick: () => buttonPressed('÷'), color: Colors.orange ),
            ],
          ),
          Row(
            children: [
              buildButton(text: '4',onClick: () => buttonPressed('4'),),
              buildButton(text: '5',onClick: () => buttonPressed('5'),),
              buildButton(text: '6',onClick: () => buttonPressed('6'),),
              buildButton(text: 'x',onClick: () => buttonPressed('×'), color: Colors.orange ),
            ],
          ),
          Row(
            children: [
              buildButton(text: '1',onClick: () => buttonPressed('1'),),
              buildButton(text: '2',onClick: () => buttonPressed('2'),),
              buildButton(text: '3',onClick: () => buttonPressed('3'),),
              buildButton(text: '-',onClick: () => buttonPressed('-'), color: Colors.orange ),
            ],
          ),
          Row(
            children: [
              buildButton(text: 'C',onClick: () => buttonPressed('C'),color: Colors.red,),
              buildButton(text: '0',onClick: () => buttonPressed('0'),),
              buildButton(text: '=',onClick: () => buttonPressed('='),color: Colors.green,),
              buildButton(text: '+',onClick: () => buttonPressed('+'), color: Colors.orange ),
            ],
          )
        ],
      ),
    );
  }
}

