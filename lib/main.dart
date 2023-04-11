import 'package:flutter/material.dart';
import 'package:website/pages/default_page.dart';
import 'package:website/pages/flutter_festival_page.dart';

import 'model/meetup.dart';
import 'pages/meetup_group_page.dart';

void main() {
  runApp(const MyApp());
}

var nextMeetup = Meetup(
  date: DateTime(2021, 06, 10, 19, 30),
  url: 'https://www.meetup.com/FlutterNL/events/278427476/',
  title: 'Google I/O Flutter Recap',
);

var flutterNlRebrandDate = DateTime(2023, 04, 13, 18, 30);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget homePage;
    if (DateTime.now().isBefore(flutterNlRebrandDate)) {
      homePage = DefaultHomePage(nextMeetup);
    } else {
      homePage = const MeetupGroupPage();
    }
    return MaterialApp(
      title: 'Flutter Netherlands',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homePage,
    );
  }
}
