import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/common_loader.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constant.dart';
import '../../../../utils/app_utils/validators/text_field_validation.dart';
import '../../../../utils/ui_utils/buttons/button.dart';
import '../../../../utils/ui_utils/fields/textfield.dart';
import '../../../../utils/ui_utils/size/size_config.dart';
import '../../../../utils/ui_utils/text/text_style.dart';
import '../../../../utils/ui_utils/text/text_widget.dart';
import '../controller/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.getPercentSize(18),
                bottom: SizeConfig.getPercentSize(8),
                left: SizeConfig.getPercentSize(10),
                right: SizeConfig.getPercentSize(10),
              ),
              child: Form(
                key: controller.loginFormKey,
                child: Center(
                  child: Column(
                    children: [
                      textWidget(
                        text: TextConstants.signUp,
                        style: authHeading(),
                      ),
                      SizedBox(height: SizeConfig.getPercentSize(8)),
                      // PTextField(
                      //   context: context,
                      //   readOnly: false,
                      //   textController: controller.userNameController,
                      //   validate: (value) => validateRequired(value),
                      //   inputType: null,
                      //   onTap: null,
                      //   obscureText: false,
                      //   onTapIcon: null,
                      //   label: TextConstants.userName,
                      //   hint: '',
                      //   icon: Icon(null),
                      // ),
                      SizedBox(height: SizeConfig.getPercentSize(3)),
                      PTextField(
                        context: context,
                        readOnly: false,
                        textController: controller.emailController,
                        validate: (value) => validateEmail(value),
                        inputType: null,
                        onTap: null,
                        obscureText: false,
                        onTapIcon: null,
                        label: TextConstants.email,
                        hint: '',
                        icon: Icon(null),
                      ),
                      SizedBox(height: SizeConfig.getPercentSize(3)),
                      Obx(
                        () => PTextField(
                          context: context,
                          readOnly: false,
                          textController: controller.passwordController,
                          validate: (value) => validatePassword(value),
                          inputType: null,
                          onTap: null,
                          obscureText: controller.isVisiblePass.value,
                          onTapIcon: () {
                            controller.setVisibiltyPass(
                                controller.isVisiblePass.value);
                          },
                          label: TextConstants.password,
                          hint: '',
                          icon: controller.isVisiblePass.value == false
                              ? Icon(
                                  Icons.visibility,
                                  color: ColorConstants.green,
                                  size: SizeConfig.getPercentSize(6),
                                )
                              : Icon(Icons.visibility_off,
                                  color: ColorConstants.green,
                                  size: SizeConfig.getPercentSize(6)),
                        ),
                      ),
                      SizedBox(height: SizeConfig.getPercentSize(8)),
                      Obx(
                        () => controller.isLoading.value
                            ? loaderWidget()
                            : PButton(
                                context: context,
                                onTap: () {
                                  if (controller.loginFormKey.currentState!
                                      .validate()) {
                                    controller.signUpWithEmail();
                                  }
                                },
                                color: ColorConstants.green,
                                text: TextConstants.register,
                              ),
                      ),
                      SizedBox(height: SizeConfig.getPercentSize(3)),
                      const Divider(
                        color: ColorConstants.green,
                      ),
                      SizedBox(height: SizeConfig.getPercentSize(3)),
                      PButton(
                        context: context,
                        onTap: () {
                          controller.signUpWithGoogle();
                        },
                        color: ColorConstants.green,
                        text: TextConstants.google,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
