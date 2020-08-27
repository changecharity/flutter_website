import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Components/header.dart';
import '../Components/imageWithText.dart';
import '../Components/info.dart';
import '../Components/footer.dart';
import '../Components/buttonOne.dart';
import '../Components/downloadApp.dart';
import '../Actions/functions.dart';

class HomePage extends StatefulWidget {
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
  final func = Functions();

  @override
  void initState() {
    super.initState();
  }

  Widget _mobileView() {
    bool mobile = true;
    return ListView(
      controller: widget.scrollController,
      children: [
        Header(
          mobile: mobile,
          actionText: " I'm a Charity ",
          actionFunc:  () => widget.nav("/org", 1),
          prefixIcon: Icons.local_library_rounded,
          suffixIcon: Icons.arrow_forward_rounded,
          title: "Spare change? Major impact! \nChange Charity",
          caption: "Give back to others when you \nspend for yourself.",
          secondAction: ButtonOne(text: "Let's Go ", icon: Icons.keyboard_arrow_right_rounded, onPressed: func.openUserApp),
          image: "assets/images/phone-dec.png",
        ),
        Info(page: "home",),
        ImageWithText(
          image: "assets/images/security.png",
          title: "Secure Transactions",
          caption: "Change Charity relies on Plaid and Stripe \n to handle all sensitive information. All \nyour data is transferred on an SSL \nsecured network, and none of your \ninformation is stored on your device.",
        ),
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
        Header(
          mobile: mobile,
          actionText: " I'm a Charity ",
          actionFunc:  () => widget.nav("/org", 1),
          prefixIcon: Icons.local_library_rounded,
          suffixIcon: Icons.arrow_forward_rounded,
          title: "Spare change? Major impact! \nChange Charity",
          caption: "Give back to others when you \nspend for yourself.",
          secondAction: DownloadApp(),
          image: "assets/images/phone-dec.png",
        ),
        Padding(padding: EdgeInsets.only(bottom: 100),),
        Info(page: "home",),
        ImageWithText(
          image: "assets/images/security.png",
          title: "Secure Transactions",
          caption: "Change Charity relies on Plaid and Stripe \n to handle all sensitive information. All \nyour data is transferred on an SSL \nsecured network, and none of your \ninformation is stored on your device.",
        ),
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
}