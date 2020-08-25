import 'dart:js' as js;

import 'package:Change_Charity_Flutter_Website/Components/%20buttonOne.dart';
import 'package:Change_Charity_Flutter_Website/Components/info.dart';

import 'Components/footer.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OrgPage extends StatefulWidget {
  final ScrollController scrollController;

  const OrgPage({
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  _OrgPageState createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {

  Widget _titleText(mobile) {
    return Container(
      margin: EdgeInsets.only(top: mobile ? 60 : 0),
      alignment: Alignment.center,
      child: Text(
        "The new way to\n generate donations",
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
        "Effortless, simple, and a\n constant stream of money.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.lightBlue[400],
          fontSize: mobile ? Theme.of(context).textTheme.headline6.fontSize : Theme.of(context).textTheme.headline5.fontSize,
        ),
      ),
    );
  }

  Widget _letsGoButton() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      alignment: Alignment.center,
      child: SizedBox(
        width: 150,
        height: 43,
        child: RaisedButton(
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          elevation: 10,
          onPressed: () {
          },
          color: Colors.lightBlue[400],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _waitingPicture(mobile) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      margin: EdgeInsets.only(top: mobile ? 60 : 0, bottom: 80),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(0),),
        child: Image.asset(
          "assets/images/product.png",
          frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedPadding(
              child: child,
              padding: EdgeInsets.only(left: frame == null ? 100 : 0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
            );
          },
          width: mobile ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.35,
        ),
      ),
    );
  }

  Widget _mobileView() {
    bool mobile = true;
    return ListView(
      controller: widget.scrollController,
      children: [
        _titleText(mobile),
        _titleCaptionText(mobile),
        ButtonOne(text: "Sign Up ", icon: Icons.keyboard_arrow_right, onPressed: _openOrgSignUp),
        _waitingPicture(mobile),
        Info(page: "org"),
        Padding(padding: EdgeInsets.only(bottom: 80),),
        Footer(),
      ],
    );
  }

  Widget _desktopView() {
    bool mobile = false;
    return ListView(
      controller: widget.scrollController,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _titleText(mobile),
                _titleCaptionText(mobile),
                ButtonOne(text: "Sign Up ", icon: Icons.keyboard_arrow_right, onPressed: _openOrgSignUp),
              ],
            ),
            _waitingPicture(mobile),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 100),),
        Info(page: "org"),
        Padding(padding: EdgeInsets.only(bottom: 80),),
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

  void _openOrgSignUp() {
    js.context.callMethod("open", ["https://auth.changecharity.io/signup"]);
  }
}