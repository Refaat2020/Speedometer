

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';

class SpeedometerSecond extends StatefulWidget {
  @override
  _SpeedometerSecondState createState() => _SpeedometerSecondState();
}

class _SpeedometerSecondState extends State<SpeedometerSecond> {

  int _value = 130;

  _SpeedometerSecondState(){
   Timer _timer = Timer.periodic(const Duration(milliseconds: 1000), (_timer) {
      setState(() {
        _value = (Random().nextInt(10) * 20 + 60);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Speedometer(
        maxValue: 260,
        minValue: 0,
        warningColor: Colors.red.shade900,
        kimColor: Colors.blue,
        meterColor: Colors.white,
        currentValue: _value,
        warningValue: 200,
        size: 300,
        displayText: "Km/h",
        displayNumericStyle: TextStyle(
          fontSize: 22,
              fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        displayTextStyle: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
