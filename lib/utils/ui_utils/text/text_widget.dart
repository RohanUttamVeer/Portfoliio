import 'package:flutter/material.dart';

Widget textWidget({
  required String text,
  required TextStyle style,
  TextAlign? textAlign,
  var overflow
}) {
  return Text(
    text,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
  );
}