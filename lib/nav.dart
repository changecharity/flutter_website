import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart' as ResponsiveBuilder;
import 'package:scroll_app_bar/scroll_app_bar.dart';

import 'Actions/functions.dart';
import 'Pages/home.dart';
import 'Pages/about.dart';
import 'Pages/org.dart';


class Navigation extends StatefulWidget {
  final String route;
  Navigation(this.route);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final scrollController = ScrollController();
  final func = Functions();

  int _page = 0;
  String initialRoute;

  @override
  void initState() {
    super.initState();
    initialRoute = widget.route;
  }

  Widget _mobileNav() {
    return CurvedNavigationBar(
      backgroundColor: Colors.grey[200],
      color: Colors.lightBlue,
      index: _page,
      items: <Widget>[
        Icon(Icons.home_rounded, size: 30,color: Colors.white,),
        Icon(Icons.local_library_rounded, size: 30,color: Colors.white),
        Icon(Icons.person_rounded, size: 30,color: Colors.white),
      ],
      onTap: (index) {
        print(index);
        if(_page == index) return;
        setState(() {
          _page = index;
        });
        switch(index) {
          case 0:
            _navigatorKey.currentState.pushNamed('/home');
            break;
          case 1:
            _navigatorKey.currentState.pushNamed('/org');
            break;
          case 2:
            _navigatorKey.currentState.pushNamed('/about');
            break;
          default:
            _navigatorKey.currentState.pushNamed('/home');
            break;
        }
      },
    );
  }

  Widget _desktopNav() {
    return ScrollAppBar(
      backgroundColor: Colors.grey[200],
      controller: scrollController,
      title: Text(
          "Change Charity",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.lightBlue[400],
        ),
      ),
      elevation: 0,
      titleSpacing: MediaQuery.of(context).size.width*0.05,
      actions: [
        _desktopNavItem('Home', 0),
        _desktopNavItem('Charity', 1),
//        _desktopNavItem('About Us', 2),
        _desktopNavItem('Charity Login', 3),
      ],
    );
  }

  Widget _desktopNavItem(String text, int page) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.025),
        child: InkWell(
          hoverColor: Colors.lightBlue[400].withOpacity(0.2),
          borderRadius:  BorderRadius.all(Radius.circular(5)),
          onTap: (){
            print(page);
            if(page == 3) {
              func.openOrgLogin();
              return;
            }
            if(_page == page) return;
            setState(() {
              _page = page;
            });
            switch(page) {
              case 0:
                _navigatorKey.currentState.pushNamed('/home');
                break;
              case 1:
                _navigatorKey.currentState.pushNamed('/org');
                break;
//              case 2:
//                _navigatorKey.currentState.pushNamed('/about');
//                break;
              default:
                _navigatorKey.currentState.pushNamed('/page2');
                break;
            }
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
                  fontSize: 18,
                  color: page == _page ? Colors.lightBlue[900] : Colors.lightBlue[400],
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
    return ResponsiveBuilder.ResponsiveBuilder(
      builder: (context, sizeInfo){
        return Scaffold(
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: sizeInfo.isMobile ? _mobileNav() : null,
          appBar: sizeInfo.isMobile ? null : _desktopNav(),
          body: Snap(
            controller: scrollController.appBar,
            child: Navigator(
              initialRoute: '/',
              key: _navigatorKey,
              onGenerateRoute: (settings){
                WidgetBuilder builder;
                print(initialRoute);
                switch (settings.name){
                  case '/':
                    builder = (BuildContext context) => HomePage(scrollController: scrollController, nav: _changePage);
                    break;
                  case '/home':
                    builder = (BuildContext context) => HomePage(scrollController: scrollController, nav: _changePage);
                    break;
                  case '/org':
                    builder = (BuildContext context) => OrgPage(scrollController: scrollController,);
                    break;
                  case '/about':
                    builder = (BuildContext context) => AboutPage();
                    break;
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
                return MaterialPageRoute(
                  builder: builder,
                  settings: settings,
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _changePage(String route, int page) {
    setState(() {
      _page = page;
    });
    _navigatorKey.currentState.pushNamed(route);
  }
}