import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        _PlatformIcon(
          icon: FontAwesomeIcons.slack,
          target: 'https://flutter-nl.slack.com/join/shared_invite/zt-fcbvctdg-k75O8dqPmmbhKeCy6YsO4g/',
        ),
        _PlatformIcon(
          icon: FontAwesomeIcons.meetup,
          target: 'https://www.meetup.com/FlutterNL',
        ),
        _PlatformIcon(
          icon: FontAwesomeIcons.twitter,
          target: 'https://twitter.com/flutternl',
        ),
        _PlatformIcon(
          icon: FontAwesomeIcons.youtube,
          target: 'https://www.youtube.com/channel/UCVDF_sL3eojqLHLI37xRe3w',
        ),
        _PlatformIcon(
          icon: FontAwesomeIcons.github,
          target: 'https://github.com/FlutterNL',
        ),
        _PlatformIcon(
          icon: FontAwesomeIcons.linkedinIn,
          target: 'https://www.linkedin.com/company/flutter-nl/',
        ),
      ],
    );
  }
}


class _PlatformIcon extends StatelessWidget {
  final IconData icon;
  final String target;

  const _PlatformIcon({Key key, this.icon, this.target}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: IconButton(
          color: Colors.blue.shade900,
          iconSize: 48.0,
          icon: FaIcon(
            icon,
            size: 36.0,
          ),
          onPressed: () {
            if (target != null) {
              launch(target);
            }
          }),
    );
  }
}
