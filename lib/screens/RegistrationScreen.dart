import 'data_screen.dart';
import 'package:flutter/material.dart';

import 'package:explora/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:explora/components/constant.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email ;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200,
                    child: Image.asset('assets/16.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value ;
                  },
                  decoration: kTextFeildDecoration.copyWith(hintText: 'Enter Your Email')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFeildDecoration.copyWith(hintText: 'Enter Your Password')
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(title: 'Register', colour: Colors.lightGreenAccent, onPressed: () async{
                setState(() {
                  showSpinner= true;
                });
                try{
                  final newUser =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newUser!= null){
                    Navigator.pushNamed(context, DataScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }
                catch(e){
                  print(e);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}