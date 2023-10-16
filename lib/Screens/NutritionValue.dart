import 'package:flutter/material.dart';

class NutritionValue extends StatefulWidget {
  const NutritionValue({super.key});

  @override
  State<NutritionValue> createState() => _NutritionValueState();
}

class _NutritionValueState extends State<NutritionValue> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02 + width * 0.1,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.001 + height * 0.001,
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: height * 0.03 + width * 0.01,
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/homepage');
                },
              ),
              SizedBox(
                width: width * 0.15 + height * 0.01,
              ),
              Center(
                child: Text(
                  "Nutrition Tracker",
                  style: TextStyle(
                    fontSize: height * 0.015 + width * 0.02,
                    color: Colors.black,
                    fontFamily: "Comfortaa",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
