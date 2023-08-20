import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/text_constant.dart';
import 'package:portfolio/utils/ui_utils/text/text_style.dart';
import 'package:portfolio/utils/ui_utils/text/text_widget.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/image_constants.dart';
import '../../../../utils/ui_utils/buttons/button.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../controller/portfolio_controller.dart';
import '../widgets/company_card.dart';
import 'github_repo_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PortfolioScreen extends GetView<PortfolioController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(SizeConfig.getPercentSize(8)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: PButton(
                    context: context,
                    color: ColorConstants.green,
                    text: 'Github Repos',
                    onTap: () {
                      controller.getGithubRepo();
                      Get.to(() => GithubRepoScreen());
                    },
                  ),
                ),
              ),
              Stack(
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
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.getPercentSize(5),
                  bottom: SizeConfig.getPercentSize(8),
                  left: SizeConfig.getPercentSize(5),
                  right: SizeConfig.getPercentSize(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.getPercentSize(2),
                    ),
                    textWidget(
                      text: TextConstants.experience,
                      style: authHeading(ColorConstants.white),
                    ),
                    ListView.builder(
                      itemCount: controller.experienceList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CompanyCard(
                          context: context,
                          role: controller.experienceList[index].role!,
                          companyName:
                              controller.experienceList[index].companyName!,
                          companyLogo:
                              controller.experienceList[index].companyLogo!,
                          exp: controller.experienceList[index].experience!,
                          isFeedback:
                              controller.experienceList[index].isFeedback!,
                          feedbackImage:
                              controller.experienceList[index].feedbackImage!,
                          feedbackBy:
                              controller.experienceList[index].feedbackBy!,
                          feedback: controller.experienceList[index].feedback!,
                        );
                      },
                    ),
                    //       SizedBox(
                    //         height: SizeConfig.getPercentSize(5),
                    //       ),
                    //       CompanyCard(
                    //         context: context,
                    //         role: TextConstants.appDeveloper,
                    //         companyName: TextConstants.freelance,
                    //         exp: TextConstants.freelanceExp,
                    //         companyLogo: AssetsConstants.assetsFreelancer,
                    //         isFeedback: false,
                    //         feedbackImage: '',
                    //         feedbackBy: '',
                    //         feedback: '',
                    //       ),
                    //       SizedBox(
                    //         height: SizeConfig.getPercentSize(5),
                    //       ),
                    //       CompanyCard(
                    //         context: context,
                    //         role:
                    //             "${TextConstants.appDev} + ${TextConstants.teamManager}",
                    //         companyName: TextConstants.btv,
                    //         exp: TextConstants.btvExp,
                    //         companyLogo: AssetsConstants.assetsBtv,
                    //         isFeedback: true,
                    //         feedbackImage: AssetsConstants.assetsVishal,
                    //         feedbackBy: TextConstants.vishalB,
                    //         feedback: kIsWeb
                    //             ? TextConstants.vishalBFeedbackWeb
                    //             : TextConstants.vishalBFeedback,
                    //       ),
                    //       SizedBox(
                    //         height: SizeConfig.getPercentSize(5),
                    //       ),
                    //       CompanyCard(
                    //         context: context,
                    //         role: TextConstants.appDevIntern,
                    //         companyName: TextConstants.appdid,
                    //         exp: TextConstants.appdidExp,
                    //         companyLogo: AssetsConstants.assetsAppdid,
                    //         isFeedback: false,
                    //         feedbackImage: '',
                    //         feedbackBy: '',
                    //         feedback: '',
                    //       ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
