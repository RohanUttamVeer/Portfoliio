import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/image_constants.dart';
import '../../../../constants/text_constant.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../utils/ui_utils/dialogs/snack_bar.dart';
import '../../domain/entities/models.dart';
import '../../domain/usecases/get_github_repo.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
    setExperienceData();
    setProjectData();
    carouselController = CarouselController();
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
  List<ExperienceModel> experienceList = [];
  List<ProjectModel> projectList = [];
  var githubRepoList = List<GithubRepoModel>.empty(growable: true).obs;
  var activeProjectIndex = 0.obs;
  // var spacing = 16.0.obs;
  // var baseWidth = 0.0.obs;
  // final colors = [
  //   Colors.greenAccent.shade100,
  //   Colors.pink.shade100,
  //   Colors.amber.shade100,
  // ];
  late AnimationController animationController;
  late Animation<Offset> offsetAnimation1;
  late Animation<Offset> offsetAnimation2;
  late CarouselController carouselController;

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
    return GithubRepoModel(
      id: data["id"].toString(),
      name: data["name"],
      language: data["language"],
      link: data["html_url"],
    );
  }

  setProjectData() {
    projectList = [
      ProjectModel(
        title: TextConstants.vani,
        description: TextConstants.vaniDes,
        image1: AssetsConstants.assetsVani1,
        image2: AssetsConstants.assetsVani2,
      ),
      ProjectModel(
        title: TextConstants.vedyug,
        description: TextConstants.vedyugDes,
        image1: AssetsConstants.assetsVedyug1,
        image2: AssetsConstants.assetsVedyug2,
      ),
      ProjectModel(
        title: TextConstants.skyu,
        description: TextConstants.skyuDes,
        image1: AssetsConstants.assetsSkyu1,
        image2: AssetsConstants.assetsSkyu2,
      ),
      ProjectModel(
        title: TextConstants.garbhSans,
        description: TextConstants.garbhDes,
        image1: AssetsConstants.assetsGS1,
        image2: AssetsConstants.assetsGS2,
      ),
      ProjectModel(
        title: TextConstants.poochesWrd,
        description: TextConstants.poochesDes,
        image1: AssetsConstants.assetsPW1,
        image2: AssetsConstants.assetsPW2,
      ),
    ];
  }

  setExperienceData() {
    experienceList = [
      ExperienceModel(
        role: TextConstants.jrFlutterDev,
        companyName: TextConstants.kaliba,
        companyLogo: AssetsConstants.assetsKaliba,
        experience: TextConstants.kalibaExp,
        isFeedback: true,
        feedbackImage: AssetsConstants.assetsJainesh,
        feedbackBy: TextConstants.jaineshP,
        feedback: kIsWeb
            ? TextConstants.jaineshPFeedbackWeb
            : TextConstants.jaineshPFeedback,
      ),
      ExperienceModel(
        role: TextConstants.appDeveloper,
        companyName: TextConstants.freelance,
        companyLogo: AssetsConstants.assetsFreelancer,
        experience: TextConstants.freelanceExp,
        isFeedback: false,
        feedbackImage: '',
        feedbackBy: '',
        feedback: '',
      ),
      ExperienceModel(
        role: "${TextConstants.appDev} + ${TextConstants.teamManager}",
        companyName: TextConstants.btv,
        companyLogo: AssetsConstants.assetsBtv,
        experience: TextConstants.btvExp,
        isFeedback: true,
        feedbackImage: AssetsConstants.assetsVishal,
        feedbackBy: TextConstants.vishalB,
        feedback: kIsWeb
            ? TextConstants.vishalBFeedbackWeb
            : TextConstants.vishalBFeedback,
      ),
      ExperienceModel(
        role: TextConstants.appDevIntern,
        companyName: TextConstants.appdid,
        companyLogo: AssetsConstants.assetsAppdid,
        experience: TextConstants.appdidExp,
        isFeedback: false,
        feedbackImage: '',
        feedbackBy: '',
        feedback: '',
      ),
    ];
  }
}
