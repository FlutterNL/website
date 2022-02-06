import 'package:flutter/material.dart';
import 'package:website/pages/default_page.dart';
import 'package:website/pages/flutter_festival_page.dart';

import 'model/meetup.dart';

void main() {
  runApp(const MyApp());
}

var nextMeetup = Meetup(
  date: DateTime(2021, 06, 10, 19, 30),
  url: 'https://www.meetup.com/FlutterNL/events/278427476/',
  title: 'Google I/O Flutter Recap',
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netherlands',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlutterFestival2022(),
    );
  }
}
