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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: Container()),
          Flexible(
            fit: FlexFit.loose,
            child: Image.asset('flutternl-logo.png'),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlatformIcon(
                  icon: FontAwesomeIcons.slack,
                  target: 'https://flutter-nl.slack.com',
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
              ],
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: IconButton(
          color: Colors.blue.shade900,
          iconSize: 36.0,
          icon: FaIcon(icon),
          onPressed: () {
            if (target != null) {
              launch(target);
            }
          }),
    );
  }
}
