import 'package:Change_Charity_Flutter_Website/Actions/functions.dart';
import 'package:Change_Charity_Flutter_Website/Components/buttonOne.dart';
import 'package:Change_Charity_Flutter_Website/Components/header.dart';
import 'package:Change_Charity_Flutter_Website/Components/info.dart';

import '../Components/footer.dart';

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
  final func = Functions();

  Widget _mobileView() {
    bool mobile = true;
    return ListView(
      controller: widget.scrollController,
      children: [
        Header(
          mobile: mobile,
          actionText: "Charity Login ",
          actionFunc:  () =>  func.openOrgLogin(),
          suffixIcon: Icons.login,
          title: "The new way to\n generate donations.",
          caption: "An effortless, simple, \nconstant stream of donations.",
          secondAction: ButtonOne(text: "Sign Up ", icon: Icons.keyboard_arrow_right_rounded, onPressed: func.openOrgSignUp),
          image: "assets/images/product.png",
        ),
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
        Header(
          mobile: mobile,
          actionText: "Charity Login ",
          actionFunc:  () => func.openOrgSignUp(),
          suffixIcon: Icons.login_rounded,
          title: "The new way to\n generate donations.",
          caption: "An effortless, simple, \nconstant stream of donations.",
          secondAction: ButtonOne(text: "Sign Up ", icon: Icons.keyboard_arrow_right_rounded, onPressed: func.openOrgSignUp),
          image: "assets/images/product.png",
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
}