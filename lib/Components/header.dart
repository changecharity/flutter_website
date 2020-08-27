import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool mobile;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String actionText;
  final actionFunc;
  final String title;
  final String caption;
  final Widget secondAction;
  final String image;

  Header({
    @required this.mobile,
    this.prefixIcon,
    this.suffixIcon,
    this.actionText,
    this.actionFunc,
    this.title,
    this.caption,
    this.secondAction,
    this.image,
  });


  Widget _firstAction(context, mobile){
    return Container(
      margin: EdgeInsets.only(top: 30, right: mobile ? MediaQuery.of(context).size.width * 0.08 : MediaQuery.of(context).size.width * 0.05,),
      child: Row(
        children: [
          Expanded(child: Container(),),
          MaterialButton(
            height: 42,
            onPressed: () {
              actionFunc();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5),),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if(prefixIcon != null) Icon(
                  prefixIcon,
                  color: Colors.lightBlue[400],
                  size: 24,
                ),
                Text(
                  actionText,
                  style: TextStyle(
                    color: Colors.lightBlue[400],
                    fontSize: 20,
                  ),
                ),
                Icon(
                  suffixIcon,
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

  Widget _titleText(context, mobile) {
    return Container(
      margin: EdgeInsets.only(top: mobile ? 60 : 0),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: mobile ? FontWeight.w900 : FontWeight.bold,
          color: Colors.lightBlue[400],
          fontSize: mobile ? Theme.of(context).textTheme.headline5.fontSize - 2 : Theme.of(context).textTheme.headline4.fontSize,
        ),
      ),
    );
  }

  Widget _titleCaptionText(context, mobile) {
    return Container(
      margin: EdgeInsets.only(top: mobile ? 20 : 30, bottom: 10),
      alignment: Alignment.center,
      child: Text(
        caption,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.lightBlue[400],
          fontSize: mobile ? Theme.of(context).textTheme.headline6.fontSize : Theme.of(context).textTheme.headline5.fontSize,
        ),
      ),
    );
  }

  Widget _picture(context, mobile) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      margin: EdgeInsets.only(top: mobile ? 60 : 0, bottom: 60),
      alignment: Alignment.center,
      child: Image.asset(
        image,
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


  Widget _mobile(context, mobile) {
    return Column(
      children: [
        _firstAction(context, mobile),
        _titleText(context, mobile),
        _titleCaptionText(context, mobile),
        secondAction,
        _picture(context, mobile)
      ],
    );
  }

  Widget _desktop(context, mobile) {
    return Column(
      children: [
        _firstAction(context, mobile),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _titleText(context, mobile),
                _titleCaptionText(context, mobile),
                secondAction,
              ],
            ),
            _picture(context, mobile),
          ],
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
      return mobile ? _mobile(context, mobile) : _desktop(context, mobile);
  }
}