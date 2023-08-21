import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../../constants/color_constants.dart';
import '../../../../utils/ui_utils/size/size_config.dart';

class CertificateCard extends StatelessWidget {
  BuildContext context;
  String image;
  CertificateCard({
    required this.context,
    required this.image,
    super.key,
  });

  @override
  Widget build(context) {
    return Container(
      height: kIsWeb
          ? SizeConfig.getPercentSize(200)
          : SizeConfig.getPercentSize(65),
      width: kIsWeb ? SizeConfig.getPercentSize(250) : null,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.getPercentSize(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.getPercentSize(3),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.white,
            blurRadius: SizeConfig.getPercentSize(2),
            spreadRadius: SizeConfig.getPercentSize(1),
            offset: Offset(
              SizeConfig.getPercentSize(1),
              SizeConfig.getPercentSize(1),
            ),
          )
        ],
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
