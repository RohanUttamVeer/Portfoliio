
// Future<void> dependencies() async {
//   // local data
//   final hive = Hive;
//   Get.lazyPut(() => hive);

// // remote data
//   Get.lazyPut<AuthController>(() => AuthController(
//         Get.find(),
//         Get.find(),
//         Get.find(),
//         Get.find(),
//       ));

//   Get.put<AuthLocalDatasource>(AuthLocalDatasourceImpl(Get.find()));
//   Get.put<AuthRemoteDatasource>(AuthRemoteDatasourceImpl());
//   Get.put<AuthRepository>(AuthRepositoryImpl(
//     Get.find(),
//     Get.find(),
//   ));

//   Get.lazyPut(() => AuthRegister(Get.find()));
//   Get.lazyPut(() => GoogleAuth(Get.find()));
//   Get.lazyPut(() => AuthSetIsLogin(Get.find()));
//   Get.lazyPut(() => AuthGetIsLogin(Get.find()));
// }
