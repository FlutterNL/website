import 'package:flutter/material.dart';
import 'package:website/components/flutter_engage_header.dart';
import 'package:website/components/platform_icons.dart';

class FlutterEngagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _BackgroundImage(),
            Column(
              children: [
                Expanded(flex: 2, child: FlutterEngageHeader()),
                PlatformIcons(color: Colors.blue.shade700),
                Expanded(flex: 3, child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      SizedBox.expand(
          child: OrientationBuilder(
            builder: (context, orientation) {
              if(orientation == Orientation.portrait) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  child: _image(context),
                );
              }
              return _image(context);
            },
          ));
  }

  Widget _image(BuildContext context){
    return Image.asset(
      'images/flutter_engage_background.jpg',
      alignment: Alignment.centerRight,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.width * 1.5,
    );
  }
}

