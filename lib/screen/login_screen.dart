import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screen/roundedbutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
late String email;
late String password;
final _auth = FirebaseAuth.instance;
bool showSpiner = false;
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
       inAsyncCall: showSpiner,
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
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                textAlign: TextAlign.center,
                style: kTextStyle,
                decoration: kInputDecoration.copyWith(
                    hintText: 'Enter your email'
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                textAlign: TextAlign.center,
                style: kTextStyle,
                decoration: kInputDecoration.copyWith(
                    hintText: 'Enter your password'
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  'Log In',
                  Colors.lightBlueAccent,
                      ()async{
                       setState(() {
                          showSpiner = true;
                       });
                       try {
                         final user = await _auth.signInWithEmailAndPassword(
                             email: email, password: password);
                         if(user != null){
                           showSpiner = false;
                           Navigator.pushNamed(context, ChatScreen.id);
                         }
                         setState(() {
                           showSpiner = false;
                         });
                       } catch (e) {print(e);}
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
