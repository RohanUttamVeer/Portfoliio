import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/common_loader.dart';
import 'package:portfolio/utils/ui_utils/text/text_style.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../controller/portfolio_controller.dart';

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
              top: SizeConfig.getPercentSize(18),
              bottom: SizeConfig.getPercentSize(8),
              left: SizeConfig.getPercentSize(10),
              right: SizeConfig.getPercentSize(10),
            ),
            child: Center(
              child: Obx(
                () => controller.isLoading.value
                    ? loaderWidget()
                    : ListView.builder(
                        itemCount: controller.githubRepoList.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text(controller.githubRepoList[index].name!,
                              style: snackbarText());
                        },
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
