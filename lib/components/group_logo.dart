import 'dart:math';

import 'package:flutter/material.dart';

class GroupLogo extends StatelessWidget {
  const GroupLogo(this.brand, {Key? key}) : super(key: key);
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Image.asset('images/logos/$brand.png'),
        FractionallySizedBox(child: _Blades(brand)),
      ],
    );
  }
}

class _Blades extends StatefulWidget {
  const _Blades(this.brand, {Key? key}) : super(key: key);
  final String brand;

  @override
  _BladesState createState() => _BladesState();
}

class _BladesState extends State<_Blades> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    final duration = widget.brand == 'netherlands' ? 5 : 7;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: duration),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: Image.asset('images/logos/wieken_${widget.brand}.png'),
      builder: (BuildContext context, Widget? _widget) {
        return Transform.rotate(
          angle: -animationController.value * 2 * pi,
          child: _widget,
          alignment: axisAlignment,
        );
      },
    );
  }
}

const Alignment axisAlignment = Alignment(0.0, -0.28);
