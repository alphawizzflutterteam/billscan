import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Helper/app_colors.dart';
import 'Helper/constant.dart';
import 'Screens/splashscreen/splash_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${ConstScreen.appName}',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.SplashBackgroundColor
      ),
      home:Splash(),
    );
  }
}
