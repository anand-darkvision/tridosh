import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NutritionValue extends StatefulWidget {
  const NutritionValue({Key? key}) : super(key: key);

  @override
  State<NutritionValue> createState() => _NutritionValueState();
}

class _NutritionValueState extends State<NutritionValue> {
  User? user = FirebaseAuth.instance.currentUser!;
  Map<int, Map<String, dynamic>> nutritionDataBreakfast = {};
  Map<int, Map<String, dynamic>> nutritionDataLunch = {};
  Map<int, Map<String, dynamic>> nutritionDataSnacks = {};
  Map<int, Map<String, dynamic>> nutritionDataDinner = {};

  void database() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshotBreakfast = await ref.child('${user!.uid}/breakfast').get();
    final snapshotLunch = await ref.child('${user!.uid}/lunch').get();
    final snapshotSnacks = await ref.child('${user!.uid}/snacks').get();
    final snapshotDinner = await ref.child('${user!.uid}/dinner').get();

    //breakfast
    if (snapshotBreakfast.exists) {
      setState(() {
        nutritionDataBreakfast = Map<int, Map<String, dynamic>>.from(
          (snapshotBreakfast.value as Map<dynamic, dynamic>).map(
            (key, value) => MapEntry(
              int.parse(key.toString()),
              Map<String, dynamic>.from(value),
            ),
          ),
        );
      });
    } else {
      print('No data available.');
    }

    //lunch
    if (snapshotLunch.exists) {
      setState(() {
        nutritionDataLunch = Map<int, Map<String, dynamic>>.from(
          (snapshotLunch.value as Map<dynamic, dynamic>).map(
            (key, value) => MapEntry(
              int.parse(key.toString()),
              Map<String, dynamic>.from(value),
            ),
          ),
        );
      });
    } else {
      print('No data available.');
    }
    //snacks
    if (snapshotSnacks.exists) {
      setState(() {
        nutritionDataSnacks = Map<int, Map<String, dynamic>>.from(
          (snapshotSnacks.value as Map<dynamic, dynamic>).map(
            (key, value) => MapEntry(
              int.parse(key.toString()),
              Map<String, dynamic>.from(value),
            ),
          ),
        );
      });
    } else {
      print('No data available.');
    }

    //breakfast
    if (snapshotDinner.exists) {
      setState(() {
        nutritionDataDinner = Map<int, Map<String, dynamic>>.from(
          (snapshotDinner.value as Map<dynamic, dynamic>).map(
            (key, value) => MapEntry(
              int.parse(key.toString()),
              Map<String, dynamic>.from(value),
            ),
          ),
        );
      });
    } else {
      print('No data available.');
    }
  }

  //breakfast
  double calculateTotalCaloriesBreakfast() {
    double totalCalories = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataBreakfast.forEach((key, value) {
      totalCalories += value['calories'] * int.parse(value['count']);
    });
    return ((totalCalories * mod).round().toDouble() / mod);
  }

  double calculateTotalFatBreakfast() {
    double totalFat = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataBreakfast.forEach((key, value) {
      totalFat += value['totalFat'] * int.parse(value['count']);
    });
    return ((totalFat * mod).round().toDouble() / mod);
  }

  //lunch
  double calculateTotalCaloriesLunch() {
    double totalCalories = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataLunch.forEach((key, value) {
      totalCalories += value['calories'] * int.parse(value['count']);
    });
    return ((totalCalories * mod).round().toDouble() / mod);
  }

  double calculateTotalFatLunch() {
    double totalFat = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataLunch.forEach((key, value) {
      totalFat += value['totalFat'] * int.parse(value['count']);
    });
    return ((totalFat * mod).round().toDouble() / mod);
  }

  //snacks
  double calculateTotalCaloriesSnacks() {
    double totalCalories = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataSnacks.forEach((key, value) {
      totalCalories += value['calories'] * int.parse(value['count']);
    });
    return ((totalCalories * mod).round().toDouble() / mod);
  }

  double calculateTotalFatSnacks() {
    double totalFat = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataSnacks.forEach((key, value) {
      totalFat += value['totalFat'] * int.parse(value['count']);
    });
    return ((totalFat * mod).round().toDouble() / mod);
  }

  //Dinner
  double calculateTotalCaloriesDinner() {
    double totalCalories = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataDinner.forEach((key, value) {
      totalCalories += value['calories'] * int.parse(value['count']);
    });
    return ((totalCalories * mod).round().toDouble() / mod);
  }

  double calculateTotalFatDinner() {
    double totalFat = 0.0;
    num mod = pow(10.0, 2);
    nutritionDataDinner.forEach((key, value) {
      totalFat += value['totalFat'] * int.parse(value['count']);
    });
    return ((totalFat * mod).round().toDouble() / mod);
  }

  @override
  void initState() {
    database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Platform.isAndroid
        ? Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            Navigator.pushReplacementNamed(
                                context, '/homepage');
                          },
                        ),
                        SizedBox(
                          width: width * 0.14 + height * 0.01,
                        ),
                        Center(
                          child: Text(
                            "Nutrition Chart",
                            style: TextStyle(
                              fontSize: height * 0.015 + width * 0.02,
                              color: Colors.black,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "BreakFast",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesBreakfast() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesBreakfast(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatBreakfast(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              "No Data Available",
                              style: TextStyle(
                                fontSize: height * 0.015 + width * 0.02,
                                color: Colors.black,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesBreakfast()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatBreakfast()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "Lunch",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesLunch() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesLunch(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatLunch(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Data Available",
                                style: TextStyle(
                                  fontSize: height * 0.015 + width * 0.02,
                                  color: Colors.black,
                                  fontFamily: "Comfortaa",
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesLunch()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatLunch()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "Snacks",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesSnacks() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesSnacks(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatSnacks(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Data Available",
                                style: TextStyle(
                                  fontSize: height * 0.015 + width * 0.02,
                                  color: Colors.black,
                                  fontFamily: "Comfortaa",
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesSnacks()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatSnacks()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "Dinner",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesDinner() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesDinner(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatDinner(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Data Available",
                                style: TextStyle(
                                  fontSize: height * 0.015 + width * 0.02,
                                  color: Colors.black,
                                  fontFamily: "Comfortaa",
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesDinner()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatDinner()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.07 + width * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          )
        : CupertinoPageScaffold(
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            Navigator.pushReplacementNamed(
                                context, '/homepage');
                          },
                        ),
                        SizedBox(
                          width: width * 0.14 + height * 0.01,
                        ),
                        Center(
                          child: Text(
                            "Nutrition Chart",
                            style: TextStyle(
                              fontSize: height * 0.015 + width * 0.02,
                              color: Colors.black,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "BreakFast",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesBreakfast() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesBreakfast(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatBreakfast(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              "No Data Available",
                              style: TextStyle(
                                fontSize: height * 0.015 + width * 0.02,
                                color: Colors.black,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesBreakfast()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatBreakfast()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "Lunch",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesLunch() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesLunch(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatLunch(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Data Available",
                                style: TextStyle(
                                  fontSize: height * 0.015 + width * 0.02,
                                  color: Colors.black,
                                  fontFamily: "Comfortaa",
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesLunch()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatLunch()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "Snacks",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesSnacks() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesSnacks(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatSnacks(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Data Available",
                                style: TextStyle(
                                  fontSize: height * 0.015 + width * 0.02,
                                  color: Colors.black,
                                  fontFamily: "Comfortaa",
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesSnacks()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatSnacks()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02 + width * 0.1,
                    ),
                    Center(
                      child: Text(
                        "Dinner",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.3 + width * 0.01,
                      width: width * 0.6 + height * 0.01,
                      child: (calculateTotalCaloriesDinner() != 0.0)
                          ? PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.greenAccent,
                                    value: calculateTotalCaloriesDinner(),
                                    title: 'Calories',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.black,
                                    ),
                                    radius: 70,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.redAccent,
                                    value: calculateTotalFatDinner(),
                                    title: 'Fat',
                                    titleStyle: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: height * 0.008 + width * 0.01,
                                      color: Colors.white,
                                    ),
                                    radius: 70,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                "No Data Available",
                                style: TextStyle(
                                  fontSize: height * 0.015 + width * 0.02,
                                  color: Colors.black,
                                  fontFamily: "Comfortaa",
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalCalorie : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalCaloriesDinner()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01 + width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "TotalFat : ",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        Text(
                          "${calculateTotalFatDinner()}",
                          style: TextStyle(
                            fontSize: height * 0.015 + width * 0.02,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.07 + width * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
