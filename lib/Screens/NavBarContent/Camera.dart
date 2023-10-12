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

  final List<Widget> screens = [
    const CameraCapture(),
    const TextCapture()
  ];

  void _setScreenIndex(int index) {
    setState(() {
      first = index == 0 ? const Color(0xFFfe8573) : const Color(0xFFfef9eb);
      second = index == 1 ? const Color(0xFFfe8573) : const Color(0xFFfef9eb);
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                    onTap: () => _setScreenIndex(0),
                    child: _buildTabContainer("Camera", first, second, height, width),
                  ),
                  GestureDetector(
                    onTap: () => _setScreenIndex(1),
                    child: _buildTabContainer("Text", second, first, height, width),
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
                  color: Colors.white,
                ),
                child: screens[_screenIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContainer(String label, Color bgColor, Color textColor, double height, double width) {
    return Container(
      height: height * 0.07 + width * 0.01,
      width: width * 0.15 + height * 0.1,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontFamily: "Comfortaa",
            fontSize: height * 0.02 + width * 0.01,
          ),
        ),
      ),
    );
  }
}
