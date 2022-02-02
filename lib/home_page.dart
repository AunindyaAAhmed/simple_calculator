// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, must_be_immutable

import 'package:calculator/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List buttons = [
    "C",
    "+/-",
    "%",
    "DEL",
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "*",
    "1",
    "2",
    "3",
    "-",
    "0",
    ".",
    "=",
    "+",
  ];

  var inputNumber = '';

  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATOR',
            style: TextStyle(fontFamily: 'Quantico', color: Colors.amber)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                //padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(inputNumber,
                          style: TextStyle(fontSize: 18, color: Colors.white))),
                  Container(
                    padding: EdgeInsets.all(17),
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(answer,
                          style: TextStyle(
                              fontSize: 38,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    ),
                  )
                ])),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return CustomButton(
                          isTapped: () {
                            setState(() {
                              inputNumber = "";
                              answer = "0";
                            });
                          },
                          texty: buttons[index],
                          color: Colors.deepPurple,
                          textColor: Colors.amber);
                    } else if (index == 1) {
                      return CustomButton(
                          isTapped: () {
                            setState(() {
                              inputNumber = "N/A";
                            });
                          },
                          texty: buttons[index],
                          color: Colors.deepPurple,
                          textColor: Colors.amber);
                    } else if (index == 2) {
                      return CustomButton(
                          isTapped: () {
                            setState(() {
                              inputNumber += buttons[index];
                            });
                          },
                          texty: buttons[index],
                          color: Colors.deepPurple,
                          textColor: Colors.amber);
                    } else if (index == 3) {
                      return CustomButton(
                          isTapped: () {
                            setState(() {
                              inputNumber = inputNumber.substring(
                                  0, inputNumber.length - 1);
                            });
                          },
                          texty: buttons[index],
                          color: Colors.deepPurple,
                          textColor: Colors.amber);
                    } else if (index == 18) {
                      return CustomButton(
                          isTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          texty: buttons[index],
                          color: Colors.deepOrange[900],
                          textColor: Colors.white);
                    } else {
                      return CustomButton(
                          isTapped: () {
                            setState(() {
                              inputNumber += buttons[index];
                            });
                          },
                          texty: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueAccent
                              : Colors.white54,
                          textColor: isOperator(buttons[index])
                              ? Colors.white54
                              : Colors.black);
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String s) {
    if (s == '/' || s == '*' || s == '+' || s == '-') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finalInputNumber = inputNumber;
    Parser p = Parser();
    Expression expression = p.parse(finalInputNumber);
    ContextModel cm = ContextModel();
    double evaluations = expression.evaluate(EvaluationType.REAL, cm);
    answer = evaluations.toString();
  }
}
