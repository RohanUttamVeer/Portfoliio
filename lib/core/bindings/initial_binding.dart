import 'package:get/get.dart';
import '../../module/auth_module/data/datasources/local/local_remote_datasources.dart';
import '../../module/auth_module/data/datasources/remote/auth_remote_datasources.dart';
import '../../module/auth_module/data/repositories/auth_repository_impl.dart';
import '../../module/auth_module/domain/repositories/auth_repository.dart';
import '../../module/auth_module/domain/usecases/auth_get_is_login.dart';
import '../../module/auth_module/domain/usecases/auth_register.dart';
import '../../module/auth_module/domain/usecases/auth_set_is_login.dart';
import '../../module/auth_module/domain/usecases/google_auth.dart';
import '../../module/auth_module/presentation/controller/auth_controller.dart';

Future<void> dependencies() async {
  // local data
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);
  // Get.lazyPut(() => http.Client());

// remote data
  Get.lazyPut<AuthController>(() => AuthController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ));
      
  Get.put<AuthLocalDatasource>(AuthLocalDatasourceImpl());
  Get.put<AuthRemoteDatasource>(AuthRemoteDatasourceImpl());
  Get.put<AuthRepository>(AuthRepositoryImpl(
    Get.find(),
    Get.find(),
  ));

  Get.lazyPut(() => AuthRegister(Get.find()));
  Get.lazyPut(() => GoogleAuth(Get.find()));
  Get.lazyPut(() => AuthSetIsLogin(Get.find()));
  Get.lazyPut(() => AuthGetIsLogin(Get.find()));
}
