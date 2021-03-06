import 'package:calculate/componets/digit_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: 200,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DigitButton(
                  color: Colors.yellow,
                  number: '1',
                  onChanged: (value){
                    print(value);

                  },
                ),
                DigitButton(
                  color: Colors.yellow,
                  number: '1',
                ),
                DigitButton(
                  color: Colors.yellow,
                  number: '1',
                ),
                DigitButton(
                  color: Colors.yellow,
                  number: '1',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
