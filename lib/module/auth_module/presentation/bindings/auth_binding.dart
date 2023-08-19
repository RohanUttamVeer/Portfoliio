import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/datasources/local/auth_local_datasources.dart';
import '../../data/datasources/remote/auth_remote_datasources.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_get_is_login.dart';
import '../../domain/usecases/auth_register.dart';
import '../../domain/usecases/auth_set_is_login.dart';
import '../../domain/usecases/google_auth.dart';
import '../controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // local data
    final hive = Hive;
    Get.lazyPut(() => hive);

// remote data
    Get.lazyPut<AuthController>(() => AuthController(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ));

    Get.put<AuthLocalDatasource>(AuthLocalDatasourceImpl(Get.find()));
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
}
