import 'package:get/get_navigation/src/routes/get_route.dart';

import '../module/auth_module/presentation/bindings/auth_binding.dart';
import '../module/auth_module/presentation/pages/auth_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
  ];
}
