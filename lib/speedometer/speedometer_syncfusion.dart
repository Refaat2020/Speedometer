

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedometereSync extends StatefulWidget {
  @override
  _SpeedometereSyncState createState() => _SpeedometereSyncState();
}

class _SpeedometereSyncState extends State<SpeedometereSync> {
  Timer _timer;
  double _value = 130;

_SpeedometereSyncState() {
  _timer = Timer.periodic(const Duration(milliseconds: 1000), (_timer) {
    setState(() {
      _value = (Random().nextDouble() * 50 + 60).truncateToDouble();
    });
  });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SfRadialGauge(

          title: GaugeTitle(
            text: "you can Scroll to see more",
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
              fontWeight: FontWeight.bold
            ),

            alignment: GaugeAlignment.center
          ),
        axes: <RadialAxis>[

          //for speedometer
          RadialAxis(
            maximum: 260,
            minimum: 0 ,
            labelOffset: 30,
            axisLineStyle: AxisLineStyle(
                color: Colors.grey,
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.03
            ),
            majorTickStyle: MajorTickStyle(
              length: 8,
              thickness: 4,
              color: Colors.blueAccent.shade700,
            ),
            minorTickStyle: MinorTickStyle(
              length: 3,
              thickness: 3,
              color: Colors.blueGrey,
            ),
            axisLabelStyle: GaugeTextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 260,
                sizeUnit: GaugeSizeUnit.factor,
                startWidth: 0.03,
                endWidth: 0.03,
                gradient: SweepGradient(
                  colors: const <Color>[
                    Colors.green,Colors.yellowAccent,Colors.red,
                  ],
                  stops: const <double>[
                    0.0,0.5,1
                  ],
                ),
              ),
            ],


            //pointer Custom
            pointers: <GaugePointer>[
              NeedlePointer(
                value: _value,
                needleLength: 0.95,
                enableAnimation: true,
                animationType: AnimationType.ease,
                needleStartWidth: 1.5,
                needleEndWidth: 6,
                needleColor: Colors.red,
                knobStyle: KnobStyle(knobRadius: 0.09),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        _value.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Km/h",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,

                        ),
                      ),
                    ],
                  ),
                ),
                angle: 90,
                positionFactor: 0.75,
              ),
            ],
          ),

          //for compass
          RadialAxis(
              startAngle: 270,
              endAngle: 270,
              majorTickStyle: MajorTickStyle(
                color: Colors.pink
              ),
              minimum: 0,
              maximum: 80,
              interval: 10,
              radiusFactor: 0.4,
              onLabelCreated: _labelCreated

          ),
        ],
      ),
    );
  }
       //for compass
  void _labelCreated(AxisLabelCreatedArgs args) {
    if(args.text == "0"){
      args.text = "N";
      args.labelStyle = GaugeTextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 16,

      );
    }
    else if(args.text =="10"){
      args.text = "";
    }
    else if(args.text == "20"){
      args.text = "E";
    }
    else if(args.text == "30"){
      args.text = "";
    }
    else if(args.text == "40"){
      args.text = "S";
    }
    else if(args.text == "50"){
      args.text = "";
    }
    else if(args.text == "60"){
      args.text = "W";
    }
    else if(args.text == "70"){
      args.text = "";
    }
  }
}
