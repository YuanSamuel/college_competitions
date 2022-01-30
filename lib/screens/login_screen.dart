import 'package:college_competitions/screens/sign_up_screen.dart';
import 'package:college_competitions/services/firebase_service.dart';
import 'package:college_competitions/utils/style_constants.dart';
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
    double height = StyleConstants.height;
    double width = StyleConstants.width;

    return Scaffold(
      body: Container(
        color: StyleConstants.darkBlue,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Container(
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                      color: StyleConstants.darkBlue,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40.0))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to ',
                          textAlign: TextAlign.center,
                          style: StyleConstants.titleTextReg
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Campus Connect',
                          textAlign: TextAlign.center,
                          style: StyleConstants.titleTextBold
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: StyleConstants.darkBlue,
                child: Container(
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                      )),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: _emailInputController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextField(
                            controller: _passwordInputController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     FirebaseService().signIn(_emailInputController.text.trim(),
                          //         _passwordInputController.text.trim());
                          //   },
                          //   child: Text("Log in"),
                          // ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                              FirebaseService().signIn(
                                  _emailInputController.text.trim(),
                                  _passwordInputController.text.trim());
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
                                  'LOGIN',
                                  style: StyleConstants.medTextBold
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account yet? ",
                                  style: StyleConstants.subTextReg,
                                ),
                                Text(
                                  'SIGN UP',
                                  style: StyleConstants.subTextBold
                                      .copyWith(color: StyleConstants.darkBlue),
                                )
                              ],
                            ),
                          ),

                          // ElevatedButton(onPressed: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (_) => SignUpScreen(),
                          //     ),
                          //   );
                          // }, child: Text("Need an account? Sign up"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     TextField(
      //       controller: _emailInputController,
      //       decoration: InputDecoration(
      //           hintText: 'Email'
      //       ),
      //     ),
      //     TextField(
      //       controller: _passwordInputController,
      //       decoration: InputDecoration(
      //           hintText: 'Password'
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         FirebaseService().signIn(_emailInputController.text.trim(),
      //             _passwordInputController.text.trim());
      //       },
      //       child: Text("Log in"),
      //     ),
      //     ElevatedButton(onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (_) => SignUpScreen(),
      //         ),
      //       );
      //     }, child: Text("Need an account? Sign up"))
      //   ],
      // ),
    );
  }
}
