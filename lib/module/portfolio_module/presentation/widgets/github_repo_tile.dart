import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../../../../utils/ui_utils/text/text_style.dart';
import '../../../../utils/ui_utils/text/text_widget.dart';

class GithubRepoTile extends StatelessWidget {
  BuildContext context;
  VoidCallback onTap;
  String name, language;
  GithubRepoTile({
    required this.context,
    required this.onTap,
    required this.name,
    required this.language,
    super.key,
  });

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: SizeConfig.getPercentSize(160),
        padding: EdgeInsets.only(
          left: SizeConfig.getPercentSize(4),
          right: SizeConfig.getPercentSize(4),
        ),
        margin: EdgeInsets.all(
          SizeConfig.getPercentSize(2),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.green,
          ),
          borderRadius: BorderRadius.circular(
            SizeConfig.getPercentSize(2),
          ),
        ),
        child: ListTile(
          // style: SizeConfig.getPercentSize(160),
          contentPadding: EdgeInsets.all(0),
          title: textWidget(
            text: name,
            style: snackbarText(),
          ),
          subtitle: textWidget(
            text: language,
            style: labelText(ColorConstants.green),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: ColorConstants.green,
            size: SizeConfig.getPercentSize(5),
          ),
        ),
      ),
    );
  }
}
