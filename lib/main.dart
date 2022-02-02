// ignore_for_file: prefer_const_constructors

import 'package:calculator/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData.dark(),
  ));
}
