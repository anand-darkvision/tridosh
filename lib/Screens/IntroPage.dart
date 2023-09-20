import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Platform.isAndroid
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.13,
                  ),
                  Text(
                    'Diet Recall',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 145, 199, 136),
                        fontFamily: 'Comfortaa',
                        fontSize: height * 0.002 + width * 0.1),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    height: height * 0.38,
                    width: width * 0.85,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("Assets/image/intro.png"),
                    )),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    "Eat Healthy",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'signikasemibold',
                      fontSize: width * 0.04 + height * 0.01,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Maintaining good health should be the",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'signikaregular',
                      fontSize: width * 0.03 + height * 0.01,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Text(
                    "primary focus of everyone.",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'signikaregular',
                      fontSize: width * 0.03 + height * 0.01,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.7,
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 145, 199, 136),
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: height * 0.024 + width * 0.002,
                              color: Colors.white,
                              fontFamily: 'signikasemibold'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.017),
                  Row(
                    children: <Widget>[
                      SizedBox(width: width * 0.14),
                      Text(
                        'Already Have An Account?',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'signikaregular',
                          fontSize: width * 0.03 + height * 0.01,
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      GestureDetector(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 145, 199, 136),
                            fontFamily: 'signikasemibold',
                            fontSize: width * 0.03 + height * 0.01,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : CupertinoPageScaffold(
            backgroundColor: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.13,
                  ),
                  Text(
                    'Diet Recall',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 145, 199, 136),
                        fontFamily: 'Comfortaa',
                        fontSize: height * 0.002 + width * 0.1),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    height: height * 0.38,
                    width: width * 0.85,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("Assets/image/intro.png"),
                    )),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    "Eat Healthy",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'signikasemibold',
                      fontSize: width * 0.04 + height * 0.01,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    "Maintaining good health should be the",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'signikaregular',
                      fontSize: width * 0.03 + height * 0.01,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Text(
                    "primary focus of everyone.",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'signikaregular',
                      fontSize: width * 0.03 + height * 0.01,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.7,
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 145, 199, 136),
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: height * 0.024 + width * 0.002,
                              color: Colors.white,
                              fontFamily: 'signikasemibold'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.017),
                  Row(
                    children: <Widget>[
                      SizedBox(width: width * 0.14),
                      Text(
                        'Already Have An Account?',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'signikaregular',
                          fontSize: width * 0.03 + height * 0.01,
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      GestureDetector(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 145, 199, 136),
                            fontFamily: 'signikasemibold',
                            fontSize: width * 0.03 + height * 0.01,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
