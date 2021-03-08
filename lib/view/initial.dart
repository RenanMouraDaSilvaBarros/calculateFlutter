import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'calculatorScreen.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Marquee(
            text: '(-__-)   Renan Moura developer   (-__-)  Dell Lead',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
             blankSpace: 300.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            velocity: 100,
          ),
        ),
        body: CalculatorScreen());
  }
}
