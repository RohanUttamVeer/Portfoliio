import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:portfolio/constants/hive_constants.dart';
import 'package:portfolio/module/portfolio_module/presentation/pages/github_repo_screen.dart';
import '../module/auth_module/presentation/bindings/auth_binding.dart';
import '../module/auth_module/presentation/pages/auth_screen.dart';
import '../module/portfolio_module/presentation/bindings/portfolio_binding.dart';
import '../module/portfolio_module/presentation/pages/portfolio_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  // final  static INITIAL = Hive.box(isLoggedHive).get(isLoggedHiveKey)
  //     ? Routes.PORTFOLIO
  //     : Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PORTFOLIO,
      page: () => PortfolioScreen(),
      binding: PortfolioBinding(),
    ),
    GetPage(
      name: _Paths.GITHUBREPO,
      page: () => GithubRepoScreen(),
      binding: PortfolioBinding(),
    ),
  ];
}
