import 'package:get/get.dart';
import '../../data/datasources/remote/portfolio_remote_datasources.dart';
import '../../data/repositories/portfolio_repository_impl.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../../domain/usecases/get_github_repo.dart';
import '../controller/portfolio_controller.dart';
import 'package:http/http.dart' as http;

class PortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());

    Get.lazyPut<PortfolioController>(
      () => PortfolioController(Get.find()),
    );

    Get.put<PortfolioRemoteDatasource>(
        PortfolioRemoteDatasourceImpl(Get.find()));

    Get.put<PortfolioRepository>(PortfolioRepositoryImpl(
      remoteDatasource: Get.find(),
    ));
    Get.lazyPut(() => GetGithubRepo(Get.find()));
  }
}
