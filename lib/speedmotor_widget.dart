

import 'package:flutter/material.dart';
import 'package:speedometer/speedometer/speedometer_second.dart';

import 'speedometer/speedometer_syncfusion.dart';

class SpeedMotor extends StatefulWidget {
  @override
  _SpeedMotorState createState() => _SpeedMotorState();
}

class _SpeedMotorState extends State<SpeedMotor> {
  @override
  Widget build(BuildContext context) {

    return PageView(
      scrollDirection: Axis.horizontal,

      children: <Widget>[

        // First Speedometer
        SpeedometereSync(),

        //Second Speedometer
        SpeedometerSecond(),


      ],

    );
  }
}
