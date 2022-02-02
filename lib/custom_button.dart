// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  //const CustomButton({Key? key}) : super(key: key);

  final color;
  final textColor;
  final String? texty;
  final isTapped;

  CustomButton({
    this.color,
    this.textColor,
    this.texty,
    this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isTapped,
      child: Padding(
        padding: const EdgeInsets.all(1.2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: MediaQuery.of(context).size.width * 0.21,
              width: MediaQuery.of(context).size.width * 0.21,
              color: color,
              child: Text(texty!,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700))),
        ),
      ),
    );
  }
}
