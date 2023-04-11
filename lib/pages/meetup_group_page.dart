import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/components/group_logo.dart';
import 'package:website/components/platform_icons.dart';

class MeetupGroupPage extends StatelessWidget {
  const MeetupGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLarge = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: isLarge ? const _LargeContent() : const _SmallContent(),
    );
  }
}

class _LargeContent extends StatelessWidget {
  const _LargeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        const Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: _MeetupGroupLargeBody(),
        ),
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
    );
  }
}

class _MeetupGroupLargeBody extends StatelessWidget {
  const _MeetupGroupLargeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1024),
        child: Row(
          children: const [
            Expanded(
              child: _LogoForMeetup(
                brand: 'holland',
                meetupUrl: 'https://www.meetup.com/nl-NL/flutternl',
              ),
            ),
            Expanded(child: GroupLogo('netherlands')),
            Expanded(
              child: _LogoForMeetup(
                brand: 'twente',
                meetupUrl: 'https://www.meetup.com/dutch-flutter-meetup/',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallContent extends StatelessWidget {
  const _SmallContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: constraints.maxHeight * 0.55,
                    child: Row(
                      children: const [
                        Expanded(
                          child: _LogoForMeetup(
                            brand: 'holland',
                            meetupUrl: 'https://www.meetup.com/nl-NL/flutternl',
                          ),
                        ),
                        Expanded(
                          child: _LogoForMeetup(
                            brand: 'twente',
                            meetupUrl: 'https://www.meetup.com/dutch-flutter-meetup/',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IgnorePointer(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: constraints.maxHeight * 0.5,
                      child: const GroupLogo('netherlands'),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        const PlatformIcons(),
        Container(
          height: 80,
          color: const Color(0xff043875),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Image.asset('images/logos/meetup_network.png'),
            ),
          ),
        )
      ],
    );
  }
}

class _LogoForMeetup extends StatelessWidget {
  const _LogoForMeetup({
    required this.brand,
    required this.meetupUrl,
    Key? key,
  }) : super(key: key);
  final String brand;
  final String meetupUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GroupLogo(brand),
          flex: 5,
        ),
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(32.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset('images/logos/meetup.png'),
            ),
            onTap: () => launch(meetupUrl),
          ),
          flex: 1,
        ),
      ],
    );
  }
}
