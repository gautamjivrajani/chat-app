import 'package:chatting_app/screens/login_screen.dart';
import 'package:chatting_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatting_app/widgets/w.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController controller;
  // @override
  // void initState(){
  //
  //   super.initState();
  //   controller = AnimationController(
  //     duration:Dur
  //
  //   ),
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),

                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 7.0,
                          color: Colors.white,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FlickerAnimatedText('Chat App'),
                      ],
                    ),
                  ),
                ),

                // Text("Chat_App",
                //   style: TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //     color: Colors.white,           ),
                // )
              ],
            ),
            SizedBox(height: 48.0),
            button1(
                title: 'Log In',
                c: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }),
            button1(
                title: 'Register',
                c: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
