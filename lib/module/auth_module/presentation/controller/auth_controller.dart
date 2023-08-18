import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../utils/ui_utils/dialogs/snack_bar.dart';
import '../../domain/usecases/auth_register.dart';
import '../../domain/usecases/google_auth.dart';

class AuthController extends GetxController {
  AuthController(
    this._authRegister,
    this._googleAuth,
  );

  static AuthController instance = Get.find();

  late AuthRegister _authRegister;
  late GoogleAuth _googleAuth;

  var isLoading = false.obs;
  var isVisiblePass = true.obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loadingTrue() {
    isLoading(true);
  }

  void loadingFalse() {
    isLoading(false);
  }

  setVisibiltyPass(var visible) {
    isVisiblePass(!visible);
  }

  clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  /// authenticate user using Google
  signUpWithEmail() async {
    loadingTrue();
    var registerResponse = await _authRegister.call(RegisterParams(
      email: emailController.text,
      password: passwordController.text,
    ));

    registerResponse.fold(
      (l) {
        if (l is ServerFailure) {
          showAppSnackBar(
            message: l.message,
            toastType: ToastType.error,
          );
          clearControllers();
          loadingFalse();
        }
      },
      (r) {
        // navigate to portfolio screen
        loadingFalse();
        clearControllers();
      },
    );
  }

  /// authenticate user using Google
  signUpWithGoogle() async {
    loadingTrue();
    var googleResponse = await _googleAuth.call(NoParams());

    googleResponse.fold(
      (l) {
        if (l is ServerFailure) {
          showAppSnackBar(
            message: l.message,
            toastType: ToastType.error,
          );
          loadingFalse();
          clearControllers();
        }
      },
      (r) {
        // navigate to portfolio screen
        clearControllers();
      },
    );
  }
}
