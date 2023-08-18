import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/ui_utils/size/size_config.dart';
import 'color_constants.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: SizeConfig.getPercentSize(11),
            width: SizeConfig.getPercentSize(11),
            child: CircularProgressIndicator(
              color: ColorConstants.green,
              strokeWidth: SizeConfig.getPercentSize(1.2),
            ),
          ),
        ),
      ),
    );
  }
}

loaderWidget() {
  return Center(
    child: SizedBox(
      height: SizeConfig.getPercentSize(11),
      width: SizeConfig.getPercentSize(11),
      child: CircularProgressIndicator(
        color: ColorConstants.green,
        strokeWidth: SizeConfig.getPercentSize(1.2),
      ),
    ),
  );
}
