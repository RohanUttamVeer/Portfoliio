import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/ui_utils/text/text_widget.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/common_loader.dart';
import '../../../../constants/image_constants.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../../../../utils/ui_utils/text/text_style.dart';
import '../controller/portfolio_controller.dart';
import '../widgets/github_repo_tile.dart';

class GithubRepoScreen extends GetView<PortfolioController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.getPercentSize(0),
              bottom: SizeConfig.getPercentSize(8),
              left: SizeConfig.getPercentSize(4),
              right: SizeConfig.getPercentSize(4),
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorConstants.green,
                      size: SizeConfig.getPercentSize(7),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    SizeConfig.getPercentSize(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: SizeConfig.getPercentSize(20),
                        width: SizeConfig.getPercentSize(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.getPercentSize(2),
                          ),
                          image: const DecorationImage(
                            image:
                                AssetImage(AssetsConstants.assetsAdminGithub),
                          ),
                        ),
                      ),
                      textWidget(
                        text: 'RohanUttamVeer',
                        style: buttonText(ColorConstants.white),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? loaderWidget()
                      : ListView.builder(
                          itemCount: controller.githubRepoList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GithubRepoTile(
                              context: context,
                              name: controller.githubRepoList[index].name!,
                              language:
                                  controller.githubRepoList[index].language ??
                                      "",
                              onTap: () {
                                // open webview here
                                // controller.githubRepoList[index].link!;
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
