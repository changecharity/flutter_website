import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Info extends StatelessWidget {
  Info({@required this.page});

  final String page;

  _infoContainerContent(context, mobile) {
  return mobile ? Column(
      children: [
        _getInfoChild(context, mobile, "${page}_one"),
        Divider(),
        _getInfoChild(context, mobile, "${page}_two"),
        Divider(),
        _getInfoChild(context, mobile, "${page}_three"),
      ],
    ) : IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 10),),
           _getInfoChild(context, mobile, "${page}_one"),
          VerticalDivider(),
          _getInfoChild(context, mobile, "${page}_two"),
          VerticalDivider(),
           _getInfoChild(context, mobile, "${page}_three"),
          Padding(padding: EdgeInsets.only(right: 10),),
        ],
      ),
    );
  }

  Widget _infoContainerChild(BuildContext context, IconData icon, String title, String caption) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,30,0,0),
            child: Icon(icon, color: Colors.lightBlue[400],),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,5,0,30),
            child: Text(caption),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width > 1000 ? MediaQuery.of(context).size.width * 0.12 : MediaQuery.of(context).size.width * 0.05),
          width: sizeInfo.isMobile ? MediaQuery.of(context).size.width* 0.9 : MediaQuery.of(context).size.width* 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow:  [BoxShadow(
                color:  Colors.grey[400],
                offset: Offset.fromDirection(1),
                blurRadius: 15),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: _infoContainerContent(context, sizeInfo.isMobile),
        );
      }
    );
  }

  Widget _getInfoChild(context, mobile, String child) {
    var mS = mobile ? '\n' : ' ';
    var dS = mobile ? ' ' : '\n';

    switch(child) {
      case "home_one":
        return  _infoContainerChild(context, Icons.star_rounded, "Donate your spare change", "Change Charity rounds up your${dS}credit${mS}card purchases, and${dS}donates the${mS}difference to${dS}the charity of your choice.");
        break;
      case "home_two":
        return _infoContainerChild(context, Icons.mail_rounded, "Tax-Deductible Receipts", "Monthly receipts delivered directly${dS}to${mS}your mailbox.");
        break;
      case "home_three":
        return _infoContainerChild(context ,Icons.weekend_rounded, "Hassle-free experience", "We promise a simple and hassle${dS}free${mS}way to donate. No more ${dS}scanning${mS}receipts or clicking ${dS}buttons. Simply${mS}sign up and${dS}you are all set. ");
        break;
      case "org_one":
        return _infoContainerChild(context, Icons.fast_forward_rounded, "Simple and Easy Sign-Up", "Sign up and instantly start receiving\ndonations. We handle all the${mS}complex${dS}work, from sending tax${mS}receipts to${dS}processing donations.");
        break;
      case "org_two":
        return _infoContainerChild(context, Icons.qr_code_rounded, "Custom Qr Code", "Receive a custom QR code that\nautomatically connects donors to\nyour organization.");
        break;
      case "org_three":
        return _infoContainerChild(context, Icons.dashboard_rounded, "Customized Dashboard", "Track your users and donations\nthrough a customized dashboard\nbuilt for you.");
        break;
    }
    return Container();
  }
}