import 'package:flutter/material.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/image_constants.dart';
import '../../../../constants/text_constant.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../../../../utils/ui_utils/text/text_style.dart';
import '../../../../utils/ui_utils/text/text_widget.dart';

class IntroCard extends StatelessWidget {
  BuildContext context;
  var controller;
  IntroCard({
    required this.context,
    required this.controller,
    super.key,
  });

  @override
  Widget build(context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.getPercentSize(18),
          alignment: Alignment.bottomCenter,
          child: SlideTransition(
            position: controller.offsetAnimation1,
            child: textWidget(
              text: TextConstants.adminName,
              style: bigHeading(),
            ),
          ),
        ),
        Container(
          height: SizeConfig.getPercentSize(70),
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(SizeConfig.getPercentSize(2)),
          child: SlideTransition(
            position: controller.offsetAnimation2,
            child: textWidget(
              text: TextConstants.skills,
              style: skillsHeading(ColorConstants.white),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            AssetsConstants.assetsAdminHeadshot,
            height: SizeConfig.getPercentSize(70),
          ),
        ),
        Container(
          height: SizeConfig.getPercentSize(70),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstants.transparent,
                ColorConstants.transparent,
                ColorConstants.transparent,
                ColorConstants.green,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
