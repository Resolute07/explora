import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:explora/screens/indiaScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/india1.json'),
      backgroundColor: Colors.grey,
      splashIconSize: 250.0,
      pageTransitionType: PageTransitionType.leftToRight,
      nextScreen: IndiaPage(),
      duration: 1500,
    );
  }
}
