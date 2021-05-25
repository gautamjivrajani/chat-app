import 'package:flutter/material.dart';
import 'package:chatting_app/widgets/w.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart ';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool spinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                box(
                  back: Colors.white,
                    hint: Colors.black,
                    hinttext: 'Enter your Email...',
                    co: Colors.orange,
                    onChanged: (value) {
                      style: TextStyle(color: Colors.white);
                      email = value;
                    }
                    ),
                SizedBox(
                  height: 20.0,
                ),
                box(
                    back: Colors.white,
                    hint: Colors.black,
                    hinttext: 'Enter your password...',
                    co: Colors.orange,
                    onChanged: (value) {
                      password = value;
                    }),
                SizedBox(
                  height: 24.0,
                ),
                button1(
                    title: 'Register',
                    c: Colors.white,
                    onPressed: () async {
                      setState(() {
                        spinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                        setState(() {
                          spinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
