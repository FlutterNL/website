import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformIcons extends StatelessWidget {
  final Color? color;

  const PlatformIcons({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c = color ?? Colors.blue.shade900;

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        PlatformIcon(
          icon: FontAwesomeIcons.slack,
          target:
              'https://flutter-nl.slack.com/join/shared_invite/zt-fcbvctdg-k75O8dqPmmbhKeCy6YsO4g/',
          color: c,
        ),
        PlatformIcon(
          icon: FontAwesomeIcons.twitter,
          target: 'https://twitter.com/flutternl',
          color: c,
        ),
        PlatformIcon(
          icon: FontAwesomeIcons.youtube,
          target: 'https://www.youtube.com/channel/UCVDF_sL3eojqLHLI37xRe3w',
          color: c,
        ),
        PlatformIcon(
          icon: FontAwesomeIcons.github,
          target: 'https://github.com/FlutterNL',
          color: c,
        ),
        PlatformIcon(
          icon: FontAwesomeIcons.linkedinIn,
          target: 'https://www.linkedin.com/company/flutter-nl/',
          color: c,
        ),
      ],
    );
  }
}

class PlatformIcon extends StatelessWidget {
  final IconData icon;
  final String? target;
  final Color color;

  const PlatformIcon({
    Key? key,
    required this.icon,
    this.target,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: IconButton(
          color: color,
          iconSize: 48.0,
          icon: FaIcon(
            icon,
            size: 36.0,
          ),
          onPressed: () {
            if (target != null) {
              launch(target!);
            }
          }),
    );
  }
}
