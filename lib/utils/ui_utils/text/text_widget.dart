import 'package:flutter/material.dart';

Widget textWidget({
  required String text,
  required TextStyle style,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: style,
    textAlign: textAlign,
  );
}