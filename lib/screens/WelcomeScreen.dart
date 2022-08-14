import 'LoginScreen.dart';
import 'package:flutter/material.dart';

import 'RegistrationScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:explora/components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const  String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation ;
  @override
  void initState() {

    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1), vsync: this,

    );
    animation =ColorTween(begin: Colors.blueGrey  , end: Colors.white).animate(controller);
    controller.forward();


    controller.addListener(() {
      setState(() {});
      //print(animation.value);

    });}
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('assets/india1.png'),
                height: 300.0,
                width: 200,

              ),
            ),

            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Login',colour: Colors.black54,onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(title: 'Register',colour: Colors.black54, onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            })
          ],
        ),
      ),
    );
  }
}