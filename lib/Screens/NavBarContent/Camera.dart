import 'package:dietrecall/Screens/NavBarContent/FoodEntry/CameraCapture.dart';
import 'package:dietrecall/Screens/NavBarContent/FoodEntry/TextCapture.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

Color first = const Color(0xFFfe8573);
Color second = const Color(0xFFfef9eb);

class _CameraState extends State<Camera> {
  int _screenIndex = 0;
  final screens = [
    const CameraCapture(),
    const TextCapture(),
  ];
  @override
  Widget build(BuildContext context) {
    //screen height and width
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.06 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.01 + height * 0.07,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        first = const Color(0xFFfe8573);
                        second = const Color(0xFFfef9eb);
                        _screenIndex = 0;
                      });
                    },
                    child: Container(
                      height: height * 0.07 + width * 0.01,
                      width: width * 0.15 + height * 0.1,
                      decoration: BoxDecoration(
                          color: first,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      child: Center(
                        child: Text(
                          "Camera",
                          style: TextStyle(
                            color: second,
                            fontFamily: "Comfortaa",
                            fontSize: height * 0.02 + width * 0.01,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        first = const Color(0xFFfef9eb);
                        second = const Color(0xFFfe8573);
                        _screenIndex = 1;
                      });
                    },
                    child: Container(
                      height: height * 0.07 + width * 0.01,
                      width: width * 0.15 + height * 0.1,
                      decoration: BoxDecoration(
                          color: second,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Center(
                        child: Text(
                          "Text",
                          style: TextStyle(
                            color: first,
                            fontFamily: "Comfortaa",
                            fontSize: height * 0.02 + width * 0.01,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.03,
              ),
              Container(
                width: width * 0.3 + height * 0.3,
                height: height * 0.6 + width * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: screens[_screenIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
