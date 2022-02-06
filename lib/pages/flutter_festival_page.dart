import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/components/flutternl_logo.dart';
import 'package:website/components/platform_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

const _meetupUrl = 'https://www.meetup.com/FlutterNL/events/283742843/';
enum _ScreenSize {
  small,
  medium,
  large,
}

class FlutterFestival2022 extends StatefulWidget {
  const FlutterFestival2022({Key? key}) : super(key: key);

  @override
  State<FlutterFestival2022> createState() => _FlutterFestival2022State();
}

class _FlutterFestival2022State extends State<FlutterFestival2022> {
  late ConfettiController _confettiControllerLeft;
  late ConfettiController _confettiControllerRight;

  @override
  void initState() {
    super.initState();
    _confettiControllerLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiControllerRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiControllerLeft.play();
    _confettiControllerRight.play();
  }

  @override
  void dispose() {
    _confettiControllerLeft.dispose();
    _confettiControllerRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _ScreenSize screenSize;
    if(MediaQuery.of(context).size.width < 500){
      screenSize = _ScreenSize.small;
    }else if(MediaQuery.of(context).size.width < 900){
      screenSize = _ScreenSize.medium;
    }else{
      screenSize = _ScreenSize.large;
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/Festival_SlideBG_03.png',
              fit: BoxFit.cover,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1 / 3,
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'images/Suitcase_0.png',
              alignment: Alignment.bottomCenter,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 32),
                if(screenSize != _ScreenSize.small)
                  Expanded(
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const FlutterNlLogo(),
                        _titleWidgets(context, screenSize),
                      ]
                    ),
                  ),
                if(screenSize == _ScreenSize.small)
                  ...[
                    const Expanded(child: FlutterNlLogo()),
                    _titleWidgets(context, screenSize)
                  ],
                const Flexible(flex: 2, fit: FlexFit.loose, child: FlutterMap()),
                const Expanded(child: PlatformIcons()),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _confettiWidget(_confettiControllerLeft, -math.pi/3),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _confettiWidget(_confettiControllerLeft, -2 * math.pi/3),
          ),
        ],
      ),
    );
  }

  ConfettiWidget _confettiWidget(ConfettiController controller, double direction){
    return ConfettiWidget(
      confettiController: controller,
      shouldLoop: true,
      blastDirection: direction, // radial value - RIGHT
      emissionFrequency: 0.01,
      maxBlastForce : 50,
      minBlastForce: 12.5,
      minimumSize: const Size(5,5), // set the minimum potential size for the confetti (width, height)
      maximumSize: const Size(25, 25), // set the maximum potential size for the confetti (width, height)
      numberOfParticles: 1,
      gravity: 0.1,
    );
  }

  Widget _titleWidgets(BuildContext context, _ScreenSize screenSize){
      return
        GestureDetector(
          onTap: () => launch(_meetupUrl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Flutter Festival ${screenSize != _ScreenSize.large ? '\n' : ''}'),
                      const TextSpan(
                          text: 'Netherlands',
                          style: TextStyle(color: Colors.orange)),
                    ],
                    style: GoogleFonts.openSans(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.blue.shade900),
                    )),
              ),
              Text(
                '24th of March, 17:30 in Nieuwegein',
                style: GoogleFonts.openSans(
                  textStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!,
                ),
              ),
            ],
          ),
        )
      ;
  }
}

class FlutterMap extends StatefulWidget {
  const FlutterMap({Key? key}) : super(key: key);

  @override
  _FlutterMapState createState() => _FlutterMapState();
}

class _FlutterMapState extends State<FlutterMap>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    final curve = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _animation = Tween<double>(begin: -1.0, end: -0.7).animate(curve);
    _animation.addListener(() => setState(() {}));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launch(_meetupUrl),
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('images/Map.png'),
            Align(
              alignment: Alignment(-0.06, _animation.value),
              child: FractionallySizedBox(
                child: Image.asset(
                  'images/MapPin_1.png',
                  alignment: Alignment.center,
                ),
                heightFactor: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
