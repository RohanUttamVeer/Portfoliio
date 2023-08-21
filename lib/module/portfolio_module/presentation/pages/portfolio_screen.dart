import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/image_constants.dart';
import 'package:portfolio/constants/text_constant.dart';
import 'package:portfolio/module/portfolio_module/presentation/widgets/certificate_card.dart';
import 'package:portfolio/utils/ui_utils/text/text_style.dart';
import 'package:portfolio/utils/ui_utils/text/text_widget.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/ui_utils/buttons/button.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../controller/portfolio_controller.dart';
import '../widgets/company_card.dart';
import '../widgets/intro_card.dart';
import '../widgets/project_card.dart';
import 'github_repo_screen.dart';

class PortfolioScreen extends GetView<PortfolioController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // var deviceWidth = MediaQuery.of(context).size.width;
    // controller.baseWidth(deviceWidth > 544 ? 512.0 : deviceWidth - 32);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            // shrinkWrap: true,
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
              // intro
              IntroCard(
                context: context,
                controller: controller,
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
                    // projects
                    textWidget(
                      text: TextConstants.projects,
                      style: authHeading(ColorConstants.white),
                    ),
                    SizedBox(
                      height: SizeConfig.getPercentSize(5),
                    ),
                    ProjectCard(
                      context: context,
                      controller: controller,
                      data: controller.projectList,
                    ),
                    SizedBox(
                      height: SizeConfig.getPercentSize(6),
                    ), // experience
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
                    SizedBox(
                      height: SizeConfig.getPercentSize(8),
                    ),
                    textWidget(
                      text: TextConstants.certificates,
                      style: authHeading(ColorConstants.white),
                    ),

                    Container(
                      child: Stack(
                        children: [
                          Container(
                            height: SizeConfig.getPercentSize(90),
                            child: StackedCardCarousel(
                              spaceBetweenItems: SizeConfig.getPercentSize(80),
                              items: [
                                CertificateCard(
                                  context: context,
                                  image: AssetsConstants.assetsCertificate1,
                                ),
                                CertificateCard(
                                  context: context,
                                  image: AssetsConstants.assetsCertificate2,
                                ),
                                CertificateCard(
                                  context: context,
                                  image: AssetsConstants.assetsCertificate3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: SizeConfig.getPercentSize(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
