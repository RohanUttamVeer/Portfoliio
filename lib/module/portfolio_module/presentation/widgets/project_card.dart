import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../../../../utils/ui_utils/text/text_style.dart';
import '../../../../utils/ui_utils/text/text_widget.dart';

class ProjectCard extends StatelessWidget {
  BuildContext context;
  var controller;
  var data;
  ProjectCard({
    required this.context,
    required this.controller,
    required this.data,
    super.key,
  });

  @override
  Widget build(context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller.carouselController,
          options: CarouselOptions(
            height: SizeConfig.getPercentSize(130),
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              controller.activeProjectIndex(index);
            },
          ),
          itemCount: data.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(
                SizeConfig.getPercentSize(3),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstants.green,
                ),
                borderRadius: BorderRadius.circular(
                  SizeConfig.getPercentSize(3),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textWidget(
                    text: data[index].title!,
                    style: skillsHeading(ColorConstants.white),
                  ),
                  textWidget(
                    text: data[index].description!,
                    style: labelText(ColorConstants.white),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: SizeConfig.getPercentSize(55),
                        width: SizeConfig.getPercentSize(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.getPercentSize(3),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                data[index].image1!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.getPercentSize(55),
                        width: SizeConfig.getPercentSize(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.getPercentSize(3),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                data[index].image2!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: SizeConfig.getPercentSize(4),
        ),
        Obx(
          () => Center(
            child: AnimatedSmoothIndicator(
              activeIndex: controller.activeProjectIndex.value,
              count: data.length,
              onDotClicked: (index) {
                controller.activeProjectIndex(index);
                controller.carouselController.jumpToPage(index);
              },
              effect: WormEffect(
                activeDotColor: ColorConstants.green,
                dotHeight: SizeConfig.getPercentSize(4),
                dotWidth: SizeConfig.getPercentSize(4),
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.getPercentSize(2),
        )
      ],
    );
  }
}
