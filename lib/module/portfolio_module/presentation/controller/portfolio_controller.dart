import 'package:get/get.dart';
import 'package:portfolio/core/usecases/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../utils/ui_utils/dialogs/snack_bar.dart';
import '../../domain/entities/github_repo_model.dart';
import '../../domain/usecases/get_github_repo.dart';

class PortfolioController extends GetxController {
  PortfolioController(
    this._getGithubRepo,
  );

  static PortfolioController instance = Get.find();

  late GetGithubRepo _getGithubRepo;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
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
      owner: data["owner"]["login"],
      language: data["language"],
      link: data["html_url"],
    );
  }
}
