import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/components/group_logo.dart';
import 'package:website/components/platform_icons.dart';
import 'package:website/model/meetup.dart';

class DefaultHomePage extends StatelessWidget {
  final Meetup nextMeetup;

  const DefaultHomePage(this.nextMeetup, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          const Flexible(flex: 2, fit: FlexFit.loose, child: GroupLogo('netherlands')),
          if (_isShowingEvent()) NextMeetupWidget(nextMeetup),
          const Expanded(
            child: PlatformIcons(),
          ),
        ],
      ),
    );
  }

  bool _isShowingEvent() {
    return DateTime.now().isBefore(nextMeetup.date);
  }
}

class NextMeetupWidget extends StatelessWidget {
  final Meetup nextMeetup;

  const NextMeetupWidget(this.nextMeetup, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('kk:mm dd MMMM yyyy');
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 32.0,
          right: 8.0,
          left: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Next Meetup: ${dateFormat.format(nextMeetup.date)}',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              nextMeetup.title,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.blueGrey,
                  ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      onTap: () => launch(nextMeetup.url),
    );
  }
}
