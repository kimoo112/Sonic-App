import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Helpers/Binding/binding.dart';
import 'Helpers/colors.dart';
import 'Views/screens/Splash/splash_view.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const Sonic());
}

class Sonic extends StatelessWidget {
  const Sonic({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sonic'.toUpperCase(),
            theme: ThemeData(
              scaffoldBackgroundColor: cLight,
              appBarTheme: const AppBarTheme(backgroundColor: cLight),
              fontFamily: 'Raleway',
              useMaterial3: true,
            ),
            home: const SplashView(),
            initialBinding: GetBingding(),
          );
        });
  }
}
