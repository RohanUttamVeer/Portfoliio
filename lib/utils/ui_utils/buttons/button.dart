import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../size/size_config.dart';
import '../text/text_style.dart';
import '../text/text_widget.dart';

class PButton extends StatelessWidget {
  BuildContext context;
  VoidCallback onTap;
  var color;
  String text;
  PButton({
    required this.context,
    required this.onTap,
    required this.color,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.getPercentSize(14),
        width: SizeConfig.getPercentSize(40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            SizeConfig.getPercentSize(3),
          ),
        ),
        child: textWidget(
          text: text,
          style: buttonText(ColorConstants.mattBlack),
        ),
      ),
    );
  }
}
