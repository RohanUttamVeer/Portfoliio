import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../utils/ui_utils/dialogs/snack_bar.dart';
import '../../domain/usecases/auth_get_is_login.dart';
import '../../domain/usecases/auth_register.dart';
import '../../domain/usecases/auth_set_is_login.dart';
import '../../domain/usecases/google_auth.dart';

class AuthController extends GetxController {
  AuthController(
    this._authRegister,
    this._googleAuth,
    this._setIsLogin,
    this._getIsLogin,
  );

  static AuthController instance = Get.find();

  late AuthRegister _authRegister;
  late GoogleAuth _googleAuth;
  late AuthSetIsLogin _setIsLogin;
  late AuthGetIsLogin _getIsLogin;

  @override
  void onInit() {
    super.onInit();
    getIsLoggedIn();
  }

  @override
  void dispose() {
    super.dispose();
    Hive.close();
    clearControllers();
  }

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
    isLoading(false);
    isVisiblePass(true);
  }

  /// authenticate user using Email
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
        setIsLoggedIn();
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
        loadingFalse();
        setIsLoggedIn();
        clearControllers();
      },
    );
    loadingFalse();
  }

  /// set user as logged in
  setIsLoggedIn() async {
    loadingTrue();
    var response = await _setIsLogin.call(SetLoginParams(
      value: true,
    ));

    response.fold(
      (l) {
        if (l is CacheFailure) {
          showAppSnackBar(
            message: l.message,
            toastType: ToastType.error,
          );
          loadingFalse();
        }
      },
      (r) {
        loadingFalse();
        // Get.offAllNamed(newRouteName);
      },
    );
  }

  /// get user's login status
  getIsLoggedIn() async {
    loadingTrue();
    var response = await _getIsLogin.call(NoParams());

    response.fold(
      (l) {
        if (l is CacheFailure) {
          showAppSnackBar(
            message: l.message,
            toastType: ToastType.error,
          );
          loadingFalse();
        }
      },
      (r) {
        if (r == true) {
          log('true');
          loadingFalse();
          // Get.offAllNamed(newRouteName);
        } else {
          loadingFalse();
          log('false');
        }
      },
    );
  }
}
