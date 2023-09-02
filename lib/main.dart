import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Helpers/Binding/binding.dart';
import 'Helpers/colors.dart';
import 'Views/screens/Splash/splash_view.dart';

void main() {
  runApp(const Sonic());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class Sonic extends StatelessWidget {
  const Sonic({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
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
