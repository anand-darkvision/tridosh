import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../MachineLearningModel/Model.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  //question value
  bool value1 = false;
  double val1 = -1.0;

  bool value2 = false;
  double val_2 = -1.0;

  bool value3 = false;
  double val_3 = -1.0;

  bool value4 = false;
  double val_4 = -1.0;

  bool value5 = false;
  double val_5 = -1.0;

  bool value6 = false;
  double val_6 = -1.0;

  bool value7 = false;
  double val_7 = -1.0;

  bool value8 = false;
  double val_8 = -1.0;

  bool value9 = false;
  double val_9 = -1.0;

  bool value_10 = false;
  double val_10 = -1.0;

  bool value_11 = false;
  double val_11 = -1.0;

  bool value_12 = false;
  double val_12 = -1.0;

  bool value_13 = false;
  double val_13 = -1.0;

  bool value_14 = false;
  double val_14 = -1.0;

  bool value_15 = false;
  double val_15 = -1.0;

  bool value_16 = false;
  double val_16 = -1.0;

  bool value_17 = false;
  double val_17 = -1.0;

  bool value_18 = false;
  double val_18 = -1.0;

  bool value_19 = false;
  double val_19 = -1.0;

  bool value_20 = false;
  double val_20 = -1.0;

  @override
  Widget build(BuildContext context) {
    //screen size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Platform.isAndroid
        ? SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.07 + width * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFfe8573),
                    ),
                    width: width * 0.4 + height * 0.16,
                    height: height * 0.07 + height * 0.01,
                    child: Center(
                      child: Text(
                        "Questionnaire",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.015 + width * 0.02,
                            fontFamily: "Comfortaa"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07 + width * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "1. Body size",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Slim",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val1,
                                  onChanged: (value1) {
                                    setState(() {
                                      val1 = value1 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Medium",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val1,
                                  onChanged: (value1) {
                                    setState(() {
                                      val1 = value1 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Large",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val1,
                                  onChanged: (value1) {
                                    setState(() {
                                      val1 = value1 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.3 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "2.Body weight",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "low, difficulties in gaining weight",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_2,
                                  onChanged: (value2) {
                                    setState(() {
                                      val_2 = value2 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "moderate, no difficulties in gaining or loosing weight",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_2,
                                  onChanged: (value2) {
                                    setState(() {
                                      val_2 = value2 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "heavy, difficulties in loosing weight",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_2,
                                  onChanged: (value2) {
                                    setState(() {
                                      val_2 = value2 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "3. Height",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Tall or short",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_3,
                                  onChanged: (value3) {
                                    setState(() {
                                      val_3 = value3 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Average",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_3,
                                  onChanged: (value3) {
                                    setState(() {
                                      val_3 = value3 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Thin & sturdy / short & stocky",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_3,
                                  onChanged: (value3) {
                                    setState(() {
                                      val_3 = value3 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.3 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "4.Bone Structure",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Light, small bones, Prominent joints",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_4,
                                  onChanged: (value4) {
                                    setState(() {
                                      val_4 = value4 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Medium bone structure",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_4,
                                  onChanged: (value4) {
                                    setState(() {
                                      val_4 = value4 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Large, broad shoulders, Heavy bone structure",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_4,
                                  onChanged: (value4) {
                                    setState(() {
                                      val_4 = value4 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "5. Complexion",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Dark complexion, Tans easily",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_5,
                                  onChanged: (value5) {
                                    setState(() {
                                      val_5 = value5 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Fair skin, sun burns easily",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_5,
                                  onChanged: (value5) {
                                    setState(() {
                                      val_5 = value5 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "White, pale, tans evenly",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_5,
                                  onChanged: (value5) {
                                    setState(() {
                                      val_5 = value5 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "6.General feel of skin",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Thin and dry, cool to touch, rough",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_6,
                                  onChanged: (value6) {
                                    setState(() {
                                      val_6 = value6 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Smooth and warm, Oily T-zone",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_6,
                                  onChanged: (value6) {
                                    setState(() {
                                      val_6 = value6 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Thick and moist/greasy, cold",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_6,
                                  onChanged: (value6) {
                                    setState(() {
                                      val_6 = value6 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "7.Texture of Skin",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Dry, pigmentation and aging",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_7,
                                  onChanged: (value7) {
                                    setState(() {
                                      val_7 = value7 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Freckles, many moles, redness, rashes and acne",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_7,
                                  onChanged: (value7) {
                                    setState(() {
                                      val_7 = value7 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Soft, glowing and youthful",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_7,
                                  onChanged: (value7) {
                                    setState(() {
                                      val_7 = value7 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "8.Hair Color",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Dull, black, brown",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_8,
                                  onChanged: (value8) {
                                    setState(() {
                                      val_8 = value8 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Red, light brown, yellow",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_8,
                                  onChanged: (value8) {
                                    setState(() {
                                      val_8 = value8 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Brown",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_8,
                                  onChanged: (value8) {
                                    setState(() {
                                      val_8 = value8 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "9.Appearance of Hair",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Dry, Black Knotted, Brittle",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_9,
                                  onChanged: (value9) {
                                    setState(() {
                                      val_9 = value9 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Straight, Oily",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_9,
                                  onChanged: (value9) {
                                    setState(() {
                                      val_9 = value9 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Thick, Curly",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_9,
                                  onChanged: (value9) {
                                    setState(() {
                                      val_9 = value9 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "10.Shape of face",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Long, angular,Thin",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_10,
                                  onChanged: (value10) {
                                    setState(() {
                                      val_10 = value10 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Heart-shaped,pointed chin",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_10,
                                  onChanged: (value10) {
                                    setState(() {
                                      val_10 = value10 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Large, round, Full",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_10,
                                  onChanged: (value10) {
                                    setState(() {
                                      val_10 = value10 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.3 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "11. Eyes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Small, active, darting, dark eyes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_11,
                                  onChanged: (value11) {
                                    setState(() {
                                      val_11 = value11 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Medium sized, penetrating, light sensitivity eyes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_11,
                                  onChanged: (value11) {
                                    setState(() {
                                      val_11 = value11 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Big, round, beautiful glowing eyes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_11,
                                  onChanged: (value11) {
                                    setState(() {
                                      val_11 = value11 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "12.Eyelashes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Scanty eye lashes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_12,
                                  onChanged: (value12) {
                                    setState(() {
                                      val_12 = value12 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Moderate eye lashes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_12,
                                  onChanged: (value12) {
                                    setState(() {
                                      val_12 = value12 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Thick/ Fused eye lashes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_12,
                                  onChanged: (value12) {
                                    setState(() {
                                      val_12 = value12 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "13.Blinking of Eyes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Excessive Blinking",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_13,
                                  onChanged: (value13) {
                                    setState(() {
                                      val_13 = value13 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Moderate Blinking",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_13,
                                  onChanged: (value13) {
                                    setState(() {
                                      val_13 = value13 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "More or less stable",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_13,
                                  onChanged: (value13) {
                                    setState(() {
                                      val_13 = value13 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "14.Cheeks",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Wrinkled, Sunken",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_14,
                                  onChanged: (value14) {
                                    setState(() {
                                      val_14 = value14 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Smooth, Flat",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_14,
                                  onChanged: (value14) {
                                    setState(() {
                                      val_14 = value14 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Rounded, Plump",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_14,
                                  onChanged: (value14) {
                                    setState(() {
                                      val_14 = value14 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "15.Nose",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Crooked, Narrow, small",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_15,
                                  onChanged: (value15) {
                                    setState(() {
                                      val_15 = value15 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Pointed, Average",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_15,
                                  onChanged: (value15) {
                                    setState(() {
                                      val_15 = value15 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Rounded, Large open nostrils",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_15,
                                  onChanged: (value15) {
                                    setState(() {
                                      val_15 = value15 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.3 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "16.Teeth and gums",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Irregular, Protruding teeth, Receding gums",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_16,
                                  onChanged: (value16) {
                                    setState(() {
                                      val_16 = value16 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Medium sized teeth, Reddish gums",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_16,
                                  onChanged: (value16) {
                                    setState(() {
                                      val_16 = value16 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Rounded, Large open nostrils",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_16,
                                  onChanged: (value16) {
                                    setState(() {
                                      val_16 = value16 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.3 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "17. Lips",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Tight, thin, dry lips which chaps easily",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_17,
                                  onChanged: (value17) {
                                    setState(() {
                                      val_17 = value17 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Lips are soft, medium-sized",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_17,
                                  onChanged: (value17) {
                                    setState(() {
                                      val_17 = value17 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Lips are large, soft, pink and full",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_17,
                                  onChanged: (value17) {
                                    setState(() {
                                      val_17 = value17 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.3 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "18.Nails",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Dry, Rough, Brittle, Break easily",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_18,
                                  onChanged: (value18) {
                                    setState(() {
                                      val_18 = value18 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Sharp, Flexible, pink, Lustrous",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_18,
                                  onChanged: (value18) {
                                    setState(() {
                                      val_18 = value18 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Thick, Oily, Smooth, Polished",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_18,
                                  onChanged: (value18) {
                                    setState(() {
                                      val_18 = value18 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "19.Appetite",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Irregular, Scanty",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_19,
                                  onChanged: (value19) {
                                    setState(() {
                                      val_19 = value19 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Strong, Unbearable",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_19,
                                  onChanged: (value19) {
                                    setState(() {
                                      val_19 = value19 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Slow but steady",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_19,
                                  onChanged: (value19) {
                                    setState(() {
                                      val_19 = value19 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "20.Liking tastes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  "Sweet / Sour / Salty",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_20,
                                  onChanged: (value20) {
                                    setState(() {
                                      val_20 = value20 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Sweet / Bitter / Astringent",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_20,
                                  onChanged: (value20) {
                                    setState(() {
                                      val_20 = value20 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Pungent / Bitter / Astringent",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_20,
                                  onChanged: (value20) {
                                    setState(() {
                                      val_20 = value20 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05 + width * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.003 + width * 0.1,
                        width: height * 0.02 + width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: const Color(0xFFfe8573),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          onPressed: () async {
                            dynamic res = score([
                              val1.toDouble(),
                              val_2.toDouble(),
                              val_3.toDouble(),
                              val_4.toDouble(),
                              val_5.toDouble(),
                              val_6.toDouble(),
                              val_7.toDouble(),
                              val_8.toDouble(),
                              val_9.toDouble(),
                              val_10.toDouble(),
                              val_11.toDouble(),
                              val_12.toDouble(),
                              val_13.toDouble(),
                              val_14.toDouble(),
                              val_15.toDouble(),
                              val_16.toDouble(),
                              val_17.toDouble(),
                              val_18.toDouble(),
                              val_19.toDouble(),
                              val_20.toDouble()
                            ]);
                            String bodytype = '';
                            for (int i = 0; i <= 5; i++) {
                              if (res[i] == 1.0) {
                                if (i == 0) {
                                  setState(() {
                                    bodytype = 'vata';
                                  });
                                } else if (i == 1) {
                                  setState(() {
                                    bodytype = 'pitta';
                                  });
                                } else if (i == 2) {
                                  setState(() {
                                    bodytype = 'kapha';
                                  });
                                } else if (i == 3) {
                                  setState(() {
                                    bodytype = 'vata And pitta';
                                  });
                                } else if (i == 4) {
                                  setState(() {
                                    bodytype = 'vata And kapha';
                                  });
                                } else {
                                  setState(() {
                                    bodytype = 'pitta And kapha';
                                  });
                                }
                              }
                            }
                            var pref = await SharedPreferences.getInstance();
                            pref.setString("BodyType", bodytype);
                            var out = pref.getString("BodyType");
                            print(out);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, '/homepage');
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: height * 0.01 + width * 0.002,
                                ),
                                Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.013 + width * 0.01,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.white,
                                  size: height * 0.020 + width * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05 + width * 0.01,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.07 + width * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFfe8573),
                    ),
                    width: width * 0.4 + height * 0.16,
                    height: height * 0.07 + height * 0.01,
                    child: Center(
                      child: Text(
                        "Questionnaire",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.015 + width * 0.02,
                            fontFamily: "Comfortaa"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07 + width * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "1. Body size",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Slim",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val1,
                                  onChanged: (value1) {
                                    setState(() {
                                      val1 = value1 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Medium",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val1,
                                  onChanged: (value1) {
                                    setState(() {
                                      val1 = value1 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Large",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val1,
                                  onChanged: (value1) {
                                    setState(() {
                                      val1 = value1 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.32 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "2.Body weight",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "low, difficulties in gaining weight",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_2,
                                  onChanged: (value2) {
                                    setState(() {
                                      val_2 = value2 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "moderate, no difficulties in gaining or loosing weight",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_2,
                                  onChanged: (value2) {
                                    setState(() {
                                      val_2 = value2 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "heavy, difficulties in loosing weight",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_2,
                                  onChanged: (value2) {
                                    setState(() {
                                      val_2 = value2 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "3. Height",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Tall or short",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_3,
                                  onChanged: (value3) {
                                    setState(() {
                                      val_3 = value3 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Average",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_3,
                                  onChanged: (value3) {
                                    setState(() {
                                      val_3 = value3 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Thin & sturdy / short & stocky",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_3,
                                  onChanged: (value3) {
                                    setState(() {
                                      val_3 = value3 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "4.Bone Structure",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Light, small bones, Prominent joints",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_4,
                                  onChanged: (value4) {
                                    setState(() {
                                      val_4 = value4 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Medium bone structure",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_4,
                                  onChanged: (value4) {
                                    setState(() {
                                      val_4 = value4 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Large, broad shoulders, Heavy bone structure",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_4,
                                  onChanged: (value4) {
                                    setState(() {
                                      val_4 = value4 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "5. Complexion",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Dark complexion, Tans easily",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_5,
                                  onChanged: (value5) {
                                    setState(() {
                                      val_5 = value5 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Fair skin, sun burns easily",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_5,
                                  onChanged: (value5) {
                                    setState(() {
                                      val_5 = value5 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "White, pale, tans evenly",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_5,
                                  onChanged: (value5) {
                                    setState(() {
                                      val_5 = value5 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "6.General feel of skin",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Thin and dry, cool to touch, rough",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_6,
                                  onChanged: (value6) {
                                    setState(() {
                                      val_6 = value6 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Smooth and warm, Oily T-zone",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_6,
                                  onChanged: (value6) {
                                    setState(() {
                                      val_6 = value6 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Thick and moist/greasy, cold",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_6,
                                  onChanged: (value6) {
                                    setState(() {
                                      val_6 = value6 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "7.Texture of Skin",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Dry, pigmentation and aging",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_7,
                                  onChanged: (value7) {
                                    setState(() {
                                      val_7 = value7 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Freckles, many moles, redness, rashes and acne",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_7,
                                  onChanged: (value7) {
                                    setState(() {
                                      val_7 = value7 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Soft, glowing and youthful",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_7,
                                  onChanged: (value7) {
                                    setState(() {
                                      val_7 = value7 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "8.Hair Color",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Dull, black, brown",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_8,
                                  onChanged: (value8) {
                                    setState(() {
                                      val_8 = value8 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Red, light brown, yellow",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_8,
                                  onChanged: (value8) {
                                    setState(() {
                                      val_8 = value8 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Brown",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_8,
                                  onChanged: (value8) {
                                    setState(() {
                                      val_8 = value8 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "9.Appearance of Hair",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Dry, Black Knotted, Brittle",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_9,
                                  onChanged: (value9) {
                                    setState(() {
                                      val_9 = value9 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Straight, Oily",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_9,
                                  onChanged: (value9) {
                                    setState(() {
                                      val_9 = value9 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Thick, Curly",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_9,
                                  onChanged: (value9) {
                                    setState(() {
                                      val_9 = value9 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "10.Shape of face",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Long, angular,Thin",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_10,
                                  onChanged: (value10) {
                                    setState(() {
                                      val_10 = value10 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Heart-shaped,pointed chin",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_10,
                                  onChanged: (value10) {
                                    setState(() {
                                      val_10 = value10 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Large, round, Full",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_10,
                                  onChanged: (value10) {
                                    setState(() {
                                      val_10 = value10 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "11. Eyes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Small, active, darting, dark eyes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_11,
                                  onChanged: (value11) {
                                    setState(() {
                                      val_11 = value11 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Medium sized, penetrating, light sensitivity eyes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_11,
                                  onChanged: (value11) {
                                    setState(() {
                                      val_11 = value11 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Big, round, beautiful glowing eyes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_11,
                                  onChanged: (value11) {
                                    setState(() {
                                      val_11 = value11 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "12.Eyelashes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Scanty eye lashes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_12,
                                  onChanged: (value12) {
                                    setState(() {
                                      val_12 = value12 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Moderate eye lashes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_12,
                                  onChanged: (value12) {
                                    setState(() {
                                      val_12 = value12 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Thick/ Fused eye lashes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_12,
                                  onChanged: (value12) {
                                    setState(() {
                                      val_12 = value12 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "13.Blinking of Eyes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Excessive Blinking",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_13,
                                  onChanged: (value13) {
                                    setState(() {
                                      val_13 = value13 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Moderate Blinking",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_13,
                                  onChanged: (value13) {
                                    setState(() {
                                      val_13 = value13 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "More or less stable",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_13,
                                  onChanged: (value13) {
                                    setState(() {
                                      val_13 = value13 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "14.Cheeks",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Wrinkled, Sunken",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_14,
                                  onChanged: (value14) {
                                    setState(() {
                                      val_14 = value14 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Smooth, Flat",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_14,
                                  onChanged: (value14) {
                                    setState(() {
                                      val_14 = value14 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Rounded, Plump",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_14,
                                  onChanged: (value14) {
                                    setState(() {
                                      val_14 = value14 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "15.Nose",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Crooked, Narrow, small",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_15,
                                  onChanged: (value15) {
                                    setState(() {
                                      val_15 = value15 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Pointed, Average",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_15,
                                  onChanged: (value15) {
                                    setState(() {
                                      val_15 = value15 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Rounded, Large open nostrils",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_15,
                                  onChanged: (value15) {
                                    setState(() {
                                      val_15 = value15 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "16.Teeth and gums",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Irregular, Protruding teeth, Receding gums",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_16,
                                  onChanged: (value16) {
                                    setState(() {
                                      val_16 = value16 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Medium sized teeth, Reddish gums",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_16,
                                  onChanged: (value16) {
                                    setState(() {
                                      val_16 = value16 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Rounded, Large open nostrils",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_16,
                                  onChanged: (value16) {
                                    setState(() {
                                      val_16 = value16 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "17. Lips",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Tight, thin, dry lips which chaps easily",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_17,
                                  onChanged: (value17) {
                                    setState(() {
                                      val_17 = value17 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Lips are soft, medium-sized",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_17,
                                  onChanged: (value17) {
                                    setState(() {
                                      val_17 = value17 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Lips are large, soft, pink and full",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_17,
                                  onChanged: (value17) {
                                    setState(() {
                                      val_17 = value17 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "18.Nails",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Dry, Rough, Brittle, Break easily",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_18,
                                  onChanged: (value18) {
                                    setState(() {
                                      val_18 = value18 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Sharp, Flexible, pink, Lustrous",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_18,
                                  onChanged: (value18) {
                                    setState(() {
                                      val_18 = value18 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Thick, Oily, Smooth, Polished",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_18,
                                  onChanged: (value18) {
                                    setState(() {
                                      val_18 = value18 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "19.Appetite",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Irregular, Scanty",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_19,
                                  onChanged: (value19) {
                                    setState(() {
                                      val_19 = value19 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Strong, Unbearable",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_19,
                                  onChanged: (value19) {
                                    setState(() {
                                      val_19 = value19 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Slow but steady",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_19,
                                  onChanged: (value19) {
                                    setState(() {
                                      val_19 = value19 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Container(
                        width: width * 0.84 + height * 0.01,
                        height: height * 0.27 + width * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfef9eb),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02 + height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: width * 0.04 + height * 0.01,
                                  ),
                                  Text(
                                    "20.Liking tastes",
                                    style: TextStyle(
                                      fontSize: width * 0.001 * height * 0.08,
                                      color: Colors.grey[700],
                                      fontFamily: "signikasemibold",
                                    ),
                                  ),
                                ],
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Sweet / Sour / Salty",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.001 * height * 0.05,
                                      fontFamily: "signikaregular"),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 0.0,
                                  groupValue: val_20,
                                  onChanged: (value20) {
                                    setState(() {
                                      val_20 = value20 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Sweet / Bitter / Astringent",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 1.0,
                                  groupValue: val_20,
                                  onChanged: (value20) {
                                    setState(() {
                                      val_20 = value20 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              CupertinoListTile(
                                title: Text(
                                  "Pungent / Bitter / Astringent",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.001 * height * 0.05,
                                    fontFamily: "signikaregular",
                                  ),
                                ),
                                leading: CupertinoRadio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  value: 2.0,
                                  groupValue: val_20,
                                  onChanged: (value20) {
                                    setState(() {
                                      val_20 = value20 as double;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05 + width * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.003 + width * 0.1,
                        width: height * 0.02 + width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: const Color(0xFFfe8573),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          onPressed: () async {
                            dynamic res = score([
                              val1.toDouble(),
                              val_2.toDouble(),
                              val_3.toDouble(),
                              val_4.toDouble(),
                              val_5.toDouble(),
                              val_6.toDouble(),
                              val_7.toDouble(),
                              val_8.toDouble(),
                              val_9.toDouble(),
                              val_10.toDouble(),
                              val_11.toDouble(),
                              val_12.toDouble(),
                              val_13.toDouble(),
                              val_14.toDouble(),
                              val_15.toDouble(),
                              val_16.toDouble(),
                              val_17.toDouble(),
                              val_18.toDouble(),
                              val_19.toDouble(),
                              val_20.toDouble()
                            ]);
                            String bodytype = '';
                            for (int i = 0; i <= 5; i++) {
                              if (res[i] == 1.0) {
                                if (i == 0) {
                                  setState(() {
                                    bodytype = 'vata';
                                  });
                                } else if (i == 1) {
                                  setState(() {
                                    bodytype = 'pitta';
                                  });
                                } else if (i == 2) {
                                  setState(() {
                                    bodytype = 'kapha';
                                  });
                                } else if (i == 3) {
                                  setState(() {
                                    bodytype = 'vata And pitta';
                                  });
                                } else if (i == 4) {
                                  setState(() {
                                    bodytype = 'vata And kapha';
                                  });
                                } else {
                                  setState(() {
                                    bodytype = 'pitta And kapha';
                                  });
                                }
                              }
                            }
                            var pref = await SharedPreferences.getInstance();
                            pref.setString("BodyType", bodytype);
                            var out = pref.getString("BodyType");
                            print(out);
                            Navigator.pushReplacementNamed(
                                context, '/homepage');
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: height * 0.01 + width * 0.002,
                                ),
                                Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.013 + width * 0.01,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.white,
                                  size: height * 0.020 + width * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05 + width * 0.01,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
