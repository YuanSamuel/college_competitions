import 'package:college_competitions/screens/sign_up_screen.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailInputController,
            decoration: InputDecoration(
                hintText: 'Email'
            ),
          ),
          TextField(
            controller: _passwordInputController,
            decoration: InputDecoration(
                hintText: 'Password'
            ),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseService().signIn(_emailInputController.text.trim(),
                  _passwordInputController.text.trim());
            },
            child: Text("Log in"),
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SignUpScreen(),
              ),
            );
          }, child: Text("Need an account? Sign up"))
        ],
      ),
    );
  }
}
