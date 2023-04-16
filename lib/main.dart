import 'package:flutter/material.dart';

import 'pages/meetup_group_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Netherlands',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MeetupGroupPage(),
      );
}
