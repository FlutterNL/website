import 'package:flutter/material.dart';
import 'package:website/pages/default_page.dart';

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
      home: DefaultHomePage(),
    );
  }
}
