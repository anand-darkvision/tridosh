import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:dietrecall/Provider/google_sign_in.dart';
import 'package:dietrecall/Screens/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController registerEmail = TextEditingController();
  final TextEditingController registerPass = TextEditingController();
  bool loading = false;

  Future<void> emailAndPassSignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((_) {
        Navigator.pushNamed(context, '/homepage');
      }).catchError((e) {
        setState(() => loading = false);
        errorFlushBar(context, e.toString());
      });
    }
  }

  void showFlushBar(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: const Color.fromARGB(255, 58, 62, 89),
      duration: const Duration(seconds: 1),
      icon: const Icon(
        Icons.wifi_off,
        color: Colors.white,
      ),
      titleText: const Text(
        'Internet Connection',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'signikasemibold',
        ),
      ),
      message: "Ensure Your Internet Is Connected",
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
    ).show(context);
  }

  void errorFlushBar(BuildContext context, String txt) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: const Color.fromARGB(255, 58, 62, 89),
      duration: const Duration(seconds: 1),
      icon: const Icon(
        Icons.verified,
        color: Colors.white,
      ),
      titleText: const Text(
        'Error',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'signikasemibold',
        ),
      ),
      message: txt,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height * 0.18,
                      width: width * 0.999,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 145, 199, 136),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: height * 0.07),
                          Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: 'signikasemibold',
                                fontSize: height * 0.04 + width * 0.002,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.06),
                    Text(
                      'Lets Get Something!',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'signikasemibold',
                        fontSize: height * 0.02 + width * 0.02,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Good to see you back!',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: height * 0.009 + width * 0.02,
                        fontFamily: 'signikaregular',
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    GestureDetector(
                      onTap: () async {
                        try {
                          final result = await InternetAddress.lookup('example.com');
                          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                            setState(() => loading = true);
                            final googleProvider = Provider.of<GoogleSignInProvider>(context, listen: false);
                            await googleProvider.googleLogin();
                            if (googleProvider.hasListeners) {
                              setState(() => loading = false);
                              Navigator.pushNamed(context, '/homepage');
                            }
                          }
                        } on SocketException catch (_) {
                          showFlushBar(context);
                        }
                      },
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: width * 0.19),
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.black,
                              size: height * 0.02 + width * 0.01,
                            ),
                            SizedBox(width: width * 0.04),
                            Text(
                              'Google',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.009 + width * 0.02,
                                fontFamily: 'signikaregular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: width * 0.05 + height * 0.002,
                        fontFamily: 'signikaregular',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.9,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(color: Colors.black),
                        controller: registerEmail,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          registerEmail.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                            return "Please Enter a valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: height * 0.0017,
                              color: const Color.fromARGB(255, 145, 199, 136),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: height * 0.01 + width * 0.02,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.9,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        controller: registerPass,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          registerPass.text = value!;
                        },
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password is required for login";
                          }
                          if (!regex.hasMatch(value)) {
                            return "Enter Valid Password (Min. 6 Character)";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: height * 0.0017,
                              color: const Color.fromARGB(255, 145, 199, 136),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusColor: Colors.black,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: height * 0.01 + width * 0.02,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      width: width * 0.7,
                      height: height * 0.08,
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 145, 199, 136),
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onPressed: () async {
                            try {
                              final result = await InternetAddress.lookup('example.com');
                              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                emailAndPassSignIn(registerEmail.text, registerPass.text);
                              }
                            } on SocketException catch (_) {
                              showFlushBar(context);
                            }
                          },
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: height * 0.03 + width * 0.002,
                              color: Colors.white,
                              fontFamily: 'signikasemibold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New to Diet Recall?",
                          style: TextStyle(
                            fontSize: width * 0.06 + height * 0.002,
                            fontFamily: "signikasemibold",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              fontSize: width * 0.06 + height * 0.002,
                              fontFamily: 'signikaregular',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
