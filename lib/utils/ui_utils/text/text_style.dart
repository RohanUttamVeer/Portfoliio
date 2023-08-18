import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../size/size_config.dart';

TextStyle authHeading() {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(10),
    fontWeight: FontWeight.w900,
    color: ColorConstants.green,
  );
}

TextStyle labelText(var color) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4.2),
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.5,
  );
}

TextStyle buttonText(var color) {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(5),
    fontWeight: FontWeight.w600,
    color: color,
  );
}

TextStyle validateText() {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(3),
    fontWeight: FontWeight.w600,
    color: ColorConstants.red,
  );
}

TextStyle snackbarText() {
  return TextStyle(
    fontSize: SizeConfig.getPercentSize(4),
    fontWeight: FontWeight.w700,
    color: ColorConstants.white,
  );
}
