import 'package:flutter/cupertino.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double devicePixelRatio (BuildContext context) =>  MediaQuery.of(context).devicePixelRatio;

EdgeInsetsDirectional edgeInsetsAll(double value) =>
    EdgeInsetsDirectional.all(value);

EdgeInsetsDirectional edgeInsetsOnly({
  double top = 0,
  double bottom = 0,
  double start = 0,
  double end = 0,
}) =>
    EdgeInsetsDirectional.only(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );

EdgeInsets edgeInsetsSymmetric({
  double horizontal = 0,
  double vertical = 0,
}) =>
    EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );

SizedBox sizedBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: child,
    );