import 'dart:math';

import 'package:flutter/material.dart';

class FlutterNlLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Image.asset('images/flutternl_background.png'),
        FractionallySizedBox(heightFactor: 0.74, child: FlutterNlBlades()),
      ],
    );
  }
}

class FlutterNlBlades extends StatefulWidget {
  @override
  _FlutterNlBladesState createState() => _FlutterNlBladesState();
}

class _FlutterNlBladesState extends State<FlutterNlBlades>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: animationController,
      child: Image.asset('images/flutternl_foreground.png'),
      builder: (BuildContext context, Widget _widget) {
        return new Transform.rotate(
          angle: -animationController.value * 2 * pi,
          child: _widget,
        );
      },
    );
  }
}
