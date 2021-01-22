import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netherlands',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Flexible(flex: 2, fit: FlexFit.loose, child: FlutterNlLogo()),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                PlatformIcon(
                  icon: FontAwesomeIcons.slack,
                  target: 'https://flutter-nl.slack.com/join/shared_invite/zt-fcbvctdg-k75O8dqPmmbhKeCy6YsO4g/',
                ),
                PlatformIcon(
                  icon: FontAwesomeIcons.meetup,
                  target: 'https://www.meetup.com/FlutterNL',
                ),
                PlatformIcon(
                  icon: FontAwesomeIcons.twitter,
                  target: 'https://twitter.com/flutternl',
                ),
                PlatformIcon(
                  icon: FontAwesomeIcons.linkedinIn,
                  target: 'https://www.linkedin.com/company/flutter-nl/',
                ),
                PlatformIcon(
                  icon: FontAwesomeIcons.youtube,
                  target: 'https://www.youtube.com/channel/UCVDF_sL3eojqLHLI37xRe3w',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          angle: - animationController.value * 2 * pi,
          child: _widget,
        );
      },
    );
  }
}

class PlatformIcon extends StatelessWidget {
  final IconData icon;
  final String target;

  const PlatformIcon({Key key, this.icon, this.target}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: IconButton(
          color: Colors.blue.shade900,
          iconSize: 48.0,
          icon: FaIcon(icon, size: 36.0,),
          onPressed: () {
            if (target != null) {
              launch(target);
            }
          }),
    );
  }
}
