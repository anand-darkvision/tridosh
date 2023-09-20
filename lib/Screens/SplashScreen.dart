import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  var auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final user = auth.currentUser;
    if(user!=null){
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context,'/homepage');
      });
    }else{
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context,'/introscreen');
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Platform.isAndroid
        ? Scaffold(
            backgroundColor: const Color.fromARGB(255, 145, 199, 136),
            body: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: height * 0.47),
                  Text(
                    'Diet Recall',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: height * 0.001 + width * 0.13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        : CupertinoPageScaffold(
            backgroundColor: const Color.fromARGB(255, 145, 199, 136),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: height * 0.47),
                  Text(
                    'Diet Recall',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: height * 0.001 + width * 0.13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
