import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../utils/ui_utils/dialogs/snack_bar.dart';
import '../../domain/entities/github_repo_model.dart';
import '../../domain/usecases/get_github_repo.dart';

class PortfolioController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PortfolioController(
    this._getGithubRepo,
  );

  static PortfolioController instance = Get.find();

  late GetGithubRepo _getGithubRepo;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    offsetAnimation1 = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 0.0),
    ).animate(animationController);

    offsetAnimation2 = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    clearControllers();
  }

  var isLoading = false.obs;
  var githubRepoList = List<GithubRepoData>.empty(growable: true).obs;

  void loadingTrue() {
    isLoading(true);
  }

  void loadingFalse() {
    isLoading(false);
  }

  clearControllers() {
    isLoading(false);
  }

  late AnimationController animationController;
  late Animation<Offset> offsetAnimation1;
  late Animation<Offset> offsetAnimation2;

  /// get list of all public repos
  getGithubRepo() async {
    loadingTrue();
    var registerResponse = await _getGithubRepo.call(NoParams());

    registerResponse.fold(
      (l) {
        if (l is ServerFailure) {
          showAppSnackBar(
            message: l.message,
            toastType: ToastType.error,
          );
          loadingFalse();
        }
      },
      (r) async {
        githubRepoList.clear();
        for (int i = 0; i < r.data!.length; i++) {
          githubRepoList.add(await getGithubRepoData(r.data![i]));
        }
        loadingFalse();
      },
    );
  }

  getGithubRepoData(var data) async {
    return GithubRepoData(
      id: data["id"].toString(),
      name: data["name"],
      language: data["language"],
      link: data["html_url"],
    );
  }
}
