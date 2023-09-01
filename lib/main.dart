import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_store/Helpers/colors.dart';
import 'package:shoes_store/Views/screens/base_screen.dart';

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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nike',
            theme: ThemeData(
              scaffoldBackgroundColor: cLight,
              appBarTheme: const AppBarTheme(backgroundColor: cLight),
              fontFamily: 'Raleway',
              useMaterial3: true,
            ),
            home: const BaseView(),
          );
        });
  }
}
