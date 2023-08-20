import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants/color_constants.dart';
import 'constants/hive_constants.dart';
// import 'core/bindings/initial_binding.dart' as di;
import 'routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await di.dependencies();

  await Hive.initFlutter();

  await Hive.openBox(isLoggedHive);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      initialRoute: Routes.PORTFOLIO,
      //  Hive.box(isLoggedHive).get(isLoggedHiveKey) ?? false
      //     ? Routes.PORTFOLIO
      //     : Routes.AUTH,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstants.mattBlack,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
