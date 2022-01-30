import 'package:college_competitions/screens/set_up_profile_screen.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/utils/style_constants.dart';
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
    double width = StyleConstants.width;
    double height = StyleConstants.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height * 0.2,
                width: width,
                color: Colors.white,
                child: Container(
                  width: width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: StyleConstants.darkBlue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Text(
                            'Create Account',
                            style: StyleConstants.medTextBold
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 0.8,
                width: width,
                color: StyleConstants.darkBlue,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        TextField(
                          controller: _nameInputController,
                          decoration: InputDecoration(hintText: 'Full Name'),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        TextField(
                          controller: _phoneNumberInputController,
                          decoration: InputDecoration(hintText: 'Phone Number'),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        TextField(
                          controller: _emailInputController,
                          decoration: InputDecoration(hintText: 'Email'),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        TextField(
                          controller: _passwordInputController,
                          decoration: InputDecoration(hintText: 'Password'),
                          obscureText: true,
                          enableSuggestions: false,
                        ),
                        // SizedBox(height: height * 0.04,),
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     Navigator.push<void>(
                        //       context,
                        //       MaterialPageRoute<void>(
                        //           builder: (_) => SetUpProfileScreen(
                        //               name: _nameInputController.text.trim(),
                        //               phoneNumber: _phoneNumberInputController.text.trim(),
                        //               email: _emailInputController.text.trim(),
                        //               password: _passwordInputController.text.trim())),
                        //     );
                        //   },
                        //   child: Text("Sign Up"),
                        // ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (_) => SetUpProfileScreen(
                                      name: _nameInputController.text.trim(),
                                      phoneNumber:
                                          _phoneNumberInputController.text.trim(),
                                      email: _emailInputController.text.trim(),
                                      password:
                                          _passwordInputController.text.trim())),
                            );
                          },
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                              color: StyleConstants.darkBlue,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: StyleConstants.medTextBold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account yet? ",
                                style: StyleConstants.subTextReg,
                              ),
                              Text(
                                'LOGIN',
                                style: StyleConstants.subTextBold
                                    .copyWith(color: StyleConstants.darkBlue),
                              )
                            ],
                          ),
                        ),

                        // ElevatedButton(
                        //     onPressed: () {
                        //       Navigator.pop(context);
                        //     },
                        //     child: Text("Log In")),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
