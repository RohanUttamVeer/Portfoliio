import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../size/size_config.dart';
import '../text/text_style.dart';

class ThemeHelper {
  InputDecoration textInputDecoration([
    String lableText = "",
    String hintText = "",
    Widget? suffixIcon,
    VoidCallback? onTapIcon,
  ]) {
    return InputDecoration(
      labelText: lableText,
      labelStyle: labelText(ColorConstants.green),
      hintText: hintText,
      hintStyle: labelText(ColorConstants.green),
      fillColor: ColorConstants.transparent,
      border: InputBorder.none,
      suffixIcon: Padding(
        padding: EdgeInsets.all(SizeConfig.getPercentSize(1)),
        child: IconButton(
          icon: suffixIcon ?? const Icon(null),
          color: ColorConstants.green,
          onPressed: onTapIcon,
        ),
      ),
      filled: true,
      contentPadding: EdgeInsets.only(
        top: SizeConfig.getPercentSize(2),
        left: SizeConfig.getPercentSize(3),
        bottom: SizeConfig.getPercentSize(3),
      ),
      errorStyle: validateText(),
    );
  }
}
