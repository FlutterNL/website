import 'package:flutter/material.dart';
import 'package:website/components/flutternl_logo.dart';
import 'package:website/components/platform_icons.dart';

class DefaultHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Flexible(flex: 2, fit: FlexFit.loose, child: FlutterNlLogo()),
          Expanded(
            child: PlatformIcons(),
          ),
        ],
      ),
    );
  }
}
