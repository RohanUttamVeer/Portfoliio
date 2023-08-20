import 'package:flutter/material.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/image_constants.dart';
import '../../../../constants/text_constant.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../../../../utils/ui_utils/text/text_style.dart';
import '../../../../utils/ui_utils/text/text_widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CompanyCard extends StatelessWidget {
  BuildContext context;
  bool isFeedback;
  String role,
      companyName,
      exp,
      companyLogo,
      feedbackImage,
      feedbackBy,
      feedback;
  CompanyCard({
    required this.context,
    required this.isFeedback,
    required this.role,
    required this.companyName,
    required this.exp,
    required this.companyLogo,
    required this.feedbackImage,
    required this.feedbackBy,
    required this.feedback,
    super.key,
  });

  @override
  Widget build(context) {
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(
        right: kIsWeb ? SizeConfig.getPercentSize(60) : 0,
        top: SizeConfig.getPercentSize(5),
      ),
      height: isFeedback
          ? SizeConfig.getPercentSize(60)
          : SizeConfig.getPercentSize(36),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.getPercentSize(28),
            width: double.infinity,
            padding: EdgeInsets.all(
              SizeConfig.getPercentSize(4),
            ),
            margin: EdgeInsets.only(
              right: SizeConfig.getPercentSize(8),
              top: SizeConfig.getPercentSize(8),
            ),
            decoration: BoxDecoration(
              color: ColorConstants.green,
              border: Border.all(
                color: ColorConstants.white,
              ),
              borderRadius: BorderRadius.circular(
                SizeConfig.getPercentSize(2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  text: role,
                  style: buttonText(ColorConstants.mattBlack),
                ),
                textWidget(
                  text: companyName,
                  style: labelText(ColorConstants.mattBlack),
                ),
                textWidget(
                  text: exp,
                  style: smallTextStyle(ColorConstants.mattBlack),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: SizeConfig.getPercentSize(20),
              width: SizeConfig.getPercentSize(20),
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.getPercentSize(2),
                ),
                image: DecorationImage(
                  image: AssetImage(companyLogo),
                ),
              ),
            ),
          ),
          isFeedback
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: SizeConfig.getPercentSize(28),
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      SizeConfig.getPercentSize(2),
                    ),
                    margin: EdgeInsets.only(
                      left: SizeConfig.getPercentSize(8),
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.lightGreen,
                      border: Border.all(
                        color: ColorConstants.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        SizeConfig.getPercentSize(2),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: SizeConfig.getPercentSize(13),
                          width: SizeConfig.getPercentSize(13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.getPercentSize(2),
                            ),
                            image: DecorationImage(
                              image: AssetImage(feedbackImage),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.getPercentSize(3),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget(
                                text: feedbackBy,
                                style: labelText(ColorConstants.mattBlack),
                              ),
                              textWidget(
                                text: feedback,
                                style: smallTextStyle(
                                  ColorConstants.mattBlack,
                                ),
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
