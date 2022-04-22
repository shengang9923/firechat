import 'package:flutter/material.dart';
import 'package:flutter_chat/screen/login_screen.dart';
import 'package:flutter_chat/screen/registration_screen.dart';
import 'package:flutter_chat/screen/roundedbutton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with
    SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
     // upperBound: 100.0,
    );

   // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
  animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
  controller.forward();

    controller.addListener(() {
      setState(() {
      });
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',
                    textStyle:  TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              'Log In',
              Colors.lightBlueAccent,
                (){
                Navigator.pushNamed(context, LoginScreen.id);
                }
            ),
            RoundedButton(
                'Register',
                Colors.blueAccent,
                    (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }
            ),

          ],
        ),
      ),
    );
  }
}



