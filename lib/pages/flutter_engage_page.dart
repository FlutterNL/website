import 'package:flutter/material.dart';
import 'package:website/components/flutter_engage_header.dart';
import 'package:website/components/platform_icons.dart';

class FlutterEngagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox.expand(
                child: Image.asset(
              'images/flutter_engage_background.jpg',
              fit: BoxFit.cover,
            )),
            Column(
              children: [
                Expanded(flex: 2, child: FlutterEngageHeader()),
                PlatformIcons(color: Colors.blue.shade700),
                Expanded(flex: 3, child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
