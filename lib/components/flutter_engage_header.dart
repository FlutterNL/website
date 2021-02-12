import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterEngageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _FlutterNLTitle(),
              _EventButton(),
            ],
          ),
        ),
      ),
      onTap: () => launch('https://www.meetup.com/FlutterNL/events/275820871/'),
    );
  }
}

class _FlutterNLTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Flutter Netherlands',
      textAlign: TextAlign.center,
      style: _textStyle(context),
    );
  }

  TextStyle _textStyle(BuildContext context) => GoogleFonts.openSans(
      textStyle: Theme.of(context)
          .textTheme
          .headline3
          .copyWith(color: Colors.blue.shade900));
}

class _EventButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Flutter Engage Extended - March 4th 19:30',
      textAlign: TextAlign.center,
      style: _textStyle(context),
    );
  }

  TextStyle _textStyle(BuildContext context) => GoogleFonts.openSans(
      textStyle: Theme.of(context)
          .textTheme
          .headline5
          .copyWith(color: Colors.blue.shade900));
}

