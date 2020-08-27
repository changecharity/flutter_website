import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Actions/functions.dart';

/// Returns a row containing images of the playStore download and the appStore download.
/// Build in margin-top of 40.
class DownloadApp extends StatelessWidget {
  final func = Functions();

  final double playHeight;
  final double appHeight;
  final EdgeInsets margin;

  DownloadApp({
    this.playHeight,
    this.appHeight,
    this.margin,
  });

  Widget _downloadPlayApp() {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => func.openPlayStore(),
              child: Image.network(
                "https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png",
                height: playHeight ?? 75,
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => func.openAppStore(),
              child: Image.network(
                "https://miro.medium.com/max/8982/1*V9-OPWpauGEi-JMp05RC_A.png",
                height: appHeight ?? 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _downloadPlayApp();
  }
}