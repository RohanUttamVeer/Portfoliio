import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/ui_utils/buttons/button.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../controller/portfolio_controller.dart';
import 'github_repo_screen.dart';

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
              // textWidget(
              //   text: 'hi',
              //   style: authHeading(),
              // ),
              // Container(
              //   height: double.infinity,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         ColorConstants.mattBlack,
              //         ColorConstants.mattBlack,
              //         ColorConstants.green,
              //         ColorConstants.green,
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
