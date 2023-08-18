import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color_constants.dart';
import '../size/size_config.dart';
import '../text/text_style.dart';

enum ToastType {
  success,
  theme,
  error,
  warning,
  info,
}

void showAppSnackBar({
  required String message,
  ToastType toastType = ToastType.success,
  int duration = 3,
  IconData? icon,
  Color? backgroundColor,
  var textStyle,
}) {
  switch (toastType) {
    case ToastType.success:
      icon = Icons.check;
      backgroundColor = Colors.green[400]!.withOpacity(0.8);
      textStyle = snackbarText();
      break;
    case ToastType.error:
      icon = Icons.close;
      backgroundColor = Colors.red[400]!.withOpacity(0.8);
      textStyle = snackbarText();
      break;
    case ToastType.theme:
      icon = Icons.check_circle;
      backgroundColor = ColorConstants.mattBlack.withOpacity(0.8);
      textStyle = snackbarText();
      break;
    case ToastType.warning:
      icon = Icons.warning;
      backgroundColor = Colors.orange[400]!.withOpacity(0.8);
      textStyle = snackbarText();
      break;
    case ToastType.info:
      icon = Icons.info_outline;
      backgroundColor = Colors.yellow[400]!.withOpacity(0.8);
      textStyle = snackbarText();
      break;
  }

  GetSnackBar snackBar = GetSnackBar(
    duration: Duration(seconds: duration),
    borderRadius: SizeConfig.getPercentSize(5),
    messageText: Container(
      height: SizeConfig.getPercentSize(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.getPercentSize(5),
            child: Icon(
              icon,
              color: ColorConstants.white,
              size: SizeConfig.getPercentSize(4),
            ),
          ).paddingOnly(
            right: SizeConfig.getPercentSize(5),
            left: SizeConfig.getPercentSize(1),
          ),
          Flexible(
            child: Text(
              message,
              style: textStyle,
            ).paddingOnly(right: SizeConfig.getPercentSize(1)),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    margin: EdgeInsets.symmetric(horizontal: SizeConfig.getPercentSize(1)),
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.GROUNDED,
  );

  Get.showSnackbar(snackBar);
}
