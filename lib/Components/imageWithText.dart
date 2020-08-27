import 'package:flutter/material.dart';

class ImageWithText extends StatelessWidget{
  final String image;
  final String title;
  final String caption;
  final double imageWidth;
  final double imageHeight;
  final EdgeInsets imageMargin;
  final EdgeInsets titleMargin;
  final EdgeInsets captionMargin;

  ImageWithText({
    @required this.image,
    @required this.title,
    @required this.caption,
    this.imageWidth,
    this.imageHeight,
    this.imageMargin,
    this.titleMargin,
    this.captionMargin,
  });

  Widget _illustration(context) {
    return Container(
      margin: imageMargin ?? EdgeInsets.only(top: 130),
      width: imageWidth ?? MediaQuery.of(context).size.width * 0.5,
      height: imageHeight,
      child: Image.asset(
        image,
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

  Widget _title(context) {
    return Container(
      margin: titleMargin ?? EdgeInsets.only(top: 30),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.headline5.fontSize,
        ),
      ),
    );
  }

  Widget _caption(context) {
    return Container(
      margin: captionMargin ?? EdgeInsets.only(top: 15),
      child: Text(
        caption,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _illustration(context),
        _title(context),
        _caption(context),
      ],
    );
  }
}