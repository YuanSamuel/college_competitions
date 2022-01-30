import 'package:college_competitions/screens/set_up_profile_screen.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _phoneNumberInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _nameInputController,
            decoration: InputDecoration(hintText: 'Full Name'),
          ),
          TextField(
            controller: _phoneNumberInputController,
            decoration: InputDecoration(hintText: 'Phone Number'),
          ),
          TextField(
            controller: _emailInputController,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _passwordInputController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          ElevatedButton(
            onPressed: () async {
              bool works = await FirebaseService().signUp(
                  _emailInputController.text.trim(),
                  _passwordInputController.text.trim());

              if (works) {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (_) => SetUpProfileScreen(
                            name: _nameInputController.text.trim(),
                            phoneNumber:
                                _phoneNumberInputController.text.trim(),
                            email: _emailInputController.text.trim(),
                          )),
                );
              }
            },
            child: Text("Sign Up"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Log In"))
        ],
      ),
    );
  }
}
