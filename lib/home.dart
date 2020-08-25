import 'dart:js' as js;

import 'package:Change_Charity_Flutter_Website/Components/info.dart';

import 'Components/footer.dart';
import 'Components/ buttonOne.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/gestures.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';
  final ScrollController scrollController;
  final nav;

  const HomePage({
    Key key,
    this.scrollController,
    this.nav,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget _imAnOrgText(mobile){
    return Container(
      margin: EdgeInsets.only(top: 30, right: mobile ? MediaQuery.of(context).size.width * 0.08 : MediaQuery.of(context).size.width * 0.02,),
      child: Row(
        children: [
          Expanded(child: Container(),),
          MaterialButton(
            height: 42,
            onPressed: () {
              widget.nav("/org", 1);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5),),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.local_library,
                  color: Colors.lightBlue[400],
                  size: 24,
                ),
                Text(
                  " I'm an organization ",
                  style: TextStyle(
                    color: Colors.lightBlue[400],
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.lightBlue[400],
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleText(mobile) {
    return Container(
      margin: EdgeInsets.only(top: mobile ? 60 : 0),
      alignment: Alignment.center,
      child: Text(
        "Spare change? Major impact! \nChange Charity",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: mobile ? FontWeight.w900 : FontWeight.bold,
          color: Colors.lightBlue[400],
          fontSize: mobile ? Theme.of(context).textTheme.headline5.fontSize - 2 : Theme.of(context).textTheme.headline4.fontSize,
        ),
      ),
    );
  }

  Widget _titleCaptionText(mobile) {
    return Container(
      margin: EdgeInsets.only(top: mobile ? 20 : 30, bottom: 10),
      alignment: Alignment.center,
      child: Text(
        "Give back to others when you \nspend for yourself.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.lightBlue[400],
          fontSize: mobile ? Theme.of(context).textTheme.headline6.fontSize : Theme.of(context).textTheme.headline5.fontSize,
        ),
      ),
    );
  }

  Widget _downloadPlayApp() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                js.context.callMethod("open", ["https://play.google.com/store/apps/details?id=com.changecharity.app"]);
              },
              child: Image.network(
                "https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png",
                height: 75,
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                js.context.callMethod("open", ["https://apps.apple.com/app/id1522540711"]);
              },
              child: Image.network(
                "https://miro.medium.com/max/8982/1*V9-OPWpauGEi-JMp05RC_A.png",
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phonePicture(mobile) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      margin: EdgeInsets.only(top: mobile ? 60 : 0, bottom: 60),
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/phone-dec.png",
        frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedPadding(
            child: child,
            padding: EdgeInsets.only(left: frame == null ? 100 : 0, top: frame == null ? 40 : 0),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
          );
        },
        width: mobile ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * 0.35,
      ),
    );
  }

  Widget _securityIllus() {
    return Container(
      margin: EdgeInsets.only(top: 130),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Image.asset(
        "assets/images/security.png",
        frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedPadding(
            child: child,
            padding: EdgeInsets.only(right: frame == null ? 100 : 0, top: frame == null ? 40 : 0),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
          );
        },
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _securityTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "Bank Level Security",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.headline5.fontSize,
        ),
      ),
    );
  }

  Widget _securityCaption() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        "Change Charity relies on Plaid and Stripe \n to handle all sensitive information. All \nyour data is transferred on an SSL \nsecured network, and none of your \ninformation is stored on device.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _mobileView() {
    bool mobile = true;
    return ListView(
      controller: widget.scrollController,
      children: [
        _imAnOrgText(mobile),
        _titleText(mobile),
        _titleCaptionText(mobile),
        ButtonOne(text: "Let's Go ", icon: Icons.keyboard_arrow_right, onPressed: _openUserApp),
        _phonePicture(mobile),
        Info(page: "home",),
        _securityIllus(),
        _securityTitle(),
        _securityCaption(),
        Padding(padding: EdgeInsets.only(top: 200),),
        Footer(),
      ],
    );
  }

  Widget _desktopView() {
    bool mobile = false;
    return ListView(
      controller: widget.scrollController,
      children: [
        _imAnOrgText(mobile),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _titleText(mobile),
                _titleCaptionText(mobile),
                _downloadPlayApp(),
              ],
            ),
            _phonePicture(mobile),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 100),),
        Info(page: "home",),
        _securityIllus(),
        _securityTitle(),
        _securityCaption(),
        Container(height: 100,),
        Footer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        return sizeInfo.isMobile ? _mobileView() : _desktopView();
      },
    );
  }

  void _openUserApp() {
    js.context.callMethod("open", ["https://link.changecharity.io/?link=https://changecharity.io/&apn=com.changecharity.app&isi=1522540711&ibi=com.changecharity.flutter"]);
  }
}