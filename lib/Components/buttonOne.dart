import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final String text;
  final IconData icon;
  final onPressed;

  ButtonOne({this.text, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
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
            onPressed();
          },
          color: Colors.lightBlue[400],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
              ),
              if (icon != null) Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}