import 'package:chatting_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatting_app/widgets/w.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool spinner = false;
  String email;
  String password;
  User loggedinuser;

  FirebaseAuth user;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;

      if (user != null) {
        loggedinuser = user;
        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
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
                  hinttext: 'Enter your Email...',
                  co: Colors.orange,
                  onChanged: (value) {
                    email = value;
                  }),
              SizedBox(
                height: 20.0,
              ),
              box(
                  hinttext: 'Enter your Password...',
                  co: Colors.orange,
                  onChanged: (value) {
                    password = value;
                  }),
              SizedBox(
                height: 24.0,
              ),
              button1(
                  title: 'Login',
                  c: Colors.white,
                  onPressed: () async {
                    setState(() {
                      spinner = true;
                    });
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    try {
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        spinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
