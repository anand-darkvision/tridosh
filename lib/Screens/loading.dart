import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Container(
            color: const Color.fromARGB(255, 145, 199, 136),
            child: const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SpinKitWave(
                  color: Colors.white,
                  size: 50,
                  duration: Duration(seconds: 4),
                ),
              ),
            ),
          )
        : Container(
            color: const Color.fromARGB(255, 145, 199, 136),
            child: const CupertinoPageScaffold(
              backgroundColor: Colors.transparent,
              child: Center(
                child: SpinKitWave(
                  color: Colors.white,
                  size: 50,
                  duration: Duration(seconds: 4),
                ),
              ),
            ),
          );
  }
}
