import 'package:flutter/material.dart';
import 'package:portfolio/utils/ui_utils/fields/theme_helper.dart';

import '../../../constants/color_constants.dart';
import '../size/size_config.dart';
import '../text/text_style.dart';

class PTextField extends StatelessWidget {
  BuildContext context;
  String label;
  String hint;
  Icon icon;
  var readOnly;
  var textController;
  var validate;
  var inputType;
  var onTap;
  var onTapIcon;
  var obscureText;
  PTextField({
    required this.context,
    required this.label,
    required this.hint,
    required this.icon,
    required this.readOnly,
    required this.textController,
    required this.validate,
    required this.inputType,
    required this.onTap,
    required this.onTapIcon,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.getPercentSize(160),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.getPercentSize(4)),
        border: Border.all(
          color: ColorConstants.green,
          width: 2,
        ),
      ),
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: textController,
        validator: validate,
        keyboardType: inputType,
        obscureText: obscureText,
        onTap: onTap,
        style: labelText(ColorConstants.white),
        textInputAction: TextInputAction.next,
        decoration: ThemeHelper().textInputDecoration(
          label,
          hint,
          icon,
          onTapIcon,
        ),
      ),
    );
  }
}
