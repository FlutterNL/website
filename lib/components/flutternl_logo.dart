import 'dart:math';

import 'package:flutter/material.dart';

class FlutterNlLogo extends StatelessWidget {
  const FlutterNlLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Image.asset('images/flutternl_background.png'),
        const FractionallySizedBox(
            heightFactor: 0.74, child: FlutterNlBlades()),
      ],
    );
  }
}

class FlutterNlBlades extends StatefulWidget {
  const FlutterNlBlades({Key? key}) : super(key: key);

  @override
  _FlutterNlBladesState createState() => _FlutterNlBladesState();
}

class _FlutterNlBladesState extends State<FlutterNlBlades>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: Image.asset('images/flutternl_foreground.png'),
      builder: (BuildContext context, Widget? _widget) {
        return Transform.rotate(
          angle: -animationController.value * 2 * pi,
          child: _widget,
        );
      },
    );
  }
}
