import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';


class Footer extends StatelessWidget{

  Widget _gotQuestionsTitle(context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child:  Text(
        "Got Questions?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.headline6.fontSize,
        ),
      ),
    );
  }

  Widget _gotQuestionsButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        color: Colors.lightBlue[400],
        elevation: 10,
        onPressed: () => launch('mailto:support@changecharity.io?subject=AppSupport'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5),),
        ),
        child: Text(
          "Contact Support",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _nameLogo() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Image.asset("assets/images/name-logo.png"),
      height: 100,
    );
  }

  Widget _privacyAndTerms() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[800],
              ),
              children: [
                TextSpan(
                  text: "Terms of Service",
                  recognizer: TapGestureRecognizer()..onTap = () => launch("https://changecharity.io/terms-of-service"),
                ),
                TextSpan(
                  text: "   •   ",
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  recognizer: TapGestureRecognizer()..onTap = () => launch("https://changecharity.io/privacy-policy"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _copyright() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(
        "© 2020 Change Charity, LLC",
        textAlign: TextAlign.center,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      child: Column(
        children: [
          _gotQuestionsTitle(context),
          _gotQuestionsButton(),
          _nameLogo(),
          _privacyAndTerms(),
          _copyright(),
        ],
      ),
    );
  }
}