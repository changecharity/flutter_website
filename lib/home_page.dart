import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  final scrollController = ScrollController();
  int _page = 0;

  Widget _mobileNav() {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.grey[100],
      color: Colors.lightBlue,
      index: _page,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.person, size: 30),
        Icon(Icons.compare_arrows, size: 30),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }

  Widget _desktopNav() {
    return ScrollAppBar(
      backgroundColor:  Colors.grey[100],
      controller: scrollController, // Note the controller here
      title: Text(
          "Change Charity",
        style: TextStyle(
          fontSize: 26,
          color: Colors.lightBlue[400],
        ),
      ),
      elevation: 0,
      titleSpacing: MediaQuery.of(context).size.width*0.05,
      actions: [
        _desktopNavItem('Home'),
        _desktopNavItem('Who We Are'),
        _desktopNavItem('Login'),
        _desktopNavItem('Get Started!'),
      ],
    );
  }

  Widget _desktopNavItem(String text) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.025),
        child: InkWell(
          borderRadius:  BorderRadius.all(Radius.circular(2)),
          onTap: (){

          },
          onHover: (s){
            print(s);
          },
          child: Container(
            height: MediaQuery.of(context).size.height*0.05,
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.0175, left: MediaQuery.of(context).size.width*0.0175),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.lightBlue[400]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo){
        return Scaffold(
          backgroundColor: Colors.grey[100],
          bottomNavigationBar: sizeInfo.isMobile ? _mobileNav() : null,
          appBar: sizeInfo.isMobile ? null : _desktopNav(),
          body: Snap(
            controller: scrollController.appBar,
            child: ListView(
              controller: scrollController,
              children: [
                Container(
                  height: 600,
                ),
                Container(
                  height: 600,
                  color: Colors.orange[400],
                ),
                Container(
                  height: 600,
                  color: Colors.green[400],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}