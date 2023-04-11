import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/components/group_logo.dart';
import 'package:website/components/platform_icons.dart';

class MeetupGroupPage extends StatelessWidget {
  const MeetupGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Column(
                    children: [
                      const Flexible(
                        child: GroupLogo('holland'),
                        flex: 5,
                      ),
                      Flexible(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Image.asset('images/logos/meetup.png'),
                          ),
                          onTap: () => launch('https://www.meetup.com/nl-NL/flutternl'),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  const SizedBox(width: 32),
                  const GroupLogo('netherlands'),
                  const SizedBox(width: 32),
                  Column(
                    children: [
                      const Flexible(
                        child: GroupLogo('twente'),
                        flex: 5,
                      ),
                      Flexible(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Image.asset('images/logos/meetup.png'),
                          ),
                          onTap: () => launch('https://www.meetup.com/dutch-flutter-meetup/'),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              )),
          const Expanded(
            child: PlatformIcons(),
          ),
          Container(
            height: 96,
            color: const Color(0xff043875),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Image.asset('images/logos/meetup_network.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('images/meetup_network_banner.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
