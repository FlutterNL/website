import 'package:flutter/material.dart';

class FlutterEngageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 500,
        child: Image.asset(
          'images/flutter-engage-banner.png',
        ),
      ),
    );
  }
}
