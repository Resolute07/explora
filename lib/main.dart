

import 'package:explora/authentication/LoginScreen.dart';
import 'package:explora/authentication/WelcomeScreen.dart';
import 'package:explora/screens/indiaScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'package:explora/authentication/RegistrationScreen.dart';
import 'package:explora/screens/data_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'explora',
      home: SplashScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DataScreen.id: (context) => DataScreen(),
      },
    );
  }
}

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
