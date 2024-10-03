import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth Screen/loginScreen.dart';
import '../homepage/homeScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        sessonManager();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 180,
              width: 180,
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const SizedBox(
            //       height: 100,
            //     ),
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.end,
            //     //   children: [
            //     //     Image.asset(
            //     //       'assets/images/shap1.png',
            //     //       height: 170,
            //     //       width: 170,
            //     //     ),
            //     //   ],
            //     // ),
            //     Image.asset(
            //       'assets/images/logo.png',
            //       height: 150,
            //       width: 150,
            //     ),
            //     // Row(
            //     //   children: [
            //     //     Image.asset(
            //     //       'assets/images/shap.png',
            //     //       height: 170,
            //     //       width: 170,
            //     //     ),
            //     //   ],
            //     // ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }

  Future<void> sessonManager() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var sesson = prefs.getString('userId');
    print('-=========================${sesson.runtimeType}');
    print('-=========================${sesson}');

    if (sesson != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
  }
}
