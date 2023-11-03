import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPreference extends StatefulWidget {
  const FoodPreference({super.key});

  @override
  State<FoodPreference> createState() => _FoodPreferenceState();
}

class _FoodPreferenceState extends State<FoodPreference> {
  //firebase reference
  User? user = FirebaseAuth.instance.currentUser!;
  late CollectionReference _ref;
  final firestoreInstance = FirebaseFirestore.instance;

  //drop down menu items
  List<DropdownMenuItem<String>> get locationItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "South India",
          child: Text(
            "South India",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "North India",
          child: Text(
            "North India",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get foodTypeItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Vegetarian",
          child: Text(
            "Vegetarian",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "NonVegetarian",
          child: Text(
            "NonVegetarian",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get tastes {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Sweet",
          child: Text(
            "Sweet",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Sour",
          child: Text(
            "Sour",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Salty",
          child: Text(
            "Salty",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Bitter",
          child: Text(
            "Bitter",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Pungent",
          child: Text(
            "Pungent",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Astringent",
          child: Text(
            "Astringent",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get smoke {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Yes",
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "No",
          child: Text(
            "No",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get alcohol {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Yes",
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "No",
          child: Text(
            "No",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get comorb {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "None",
          child: Text(
            "None",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "High-BP",
          child: Text(
            "High-BP",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Hyper Tension",
          child: Text(
            "Hyper Tension",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Diabetes",
          child: Text(
            "Diabetes",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Cardio",
          child: Text(
            "Cardio",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get allergy {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "None",
          child: Text(
            "None",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Dairy allergies",
          child: Text(
            "Dairy allergies",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Fish allergies",
          child: Text(
            "Fish allergies",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
      const DropdownMenuItem(
          value: "Tree nuts allergies",
          child: Text(
            "Tree nuts allergies",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'comfortaa',
              color: Colors.black,
            ),
          )),
    ];
    return menuItems;
  }

  String defaultLocation = "South India";
  String defaultFoodItem = "Vegetarian";
  String defaultFoodtaste = "Sweet";
  String defaultSmoke = "No";
  String defaultAlcohol = "No";
  String defaultComorb = "None";
  String defaultAllergy = "None";

  int _location = 0;
  int _foodType = 0;
  int _foodTaste = 0;
  int _youSmoke = 0;
  int _youAlcoholic = 0;
  int _comorb = 0;
  int _allergies = 0;
  @override
  Widget build(BuildContext context) {
    //screen size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (Platform.isAndroid) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.07 + width * 0.1,
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
                    width: width * 0.16 + height * 0.01,
                  ),
                  Center(
                    child: Text(
                      "Food Preference",
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
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: height * 0.05 + height * 0.01,
                  ),
                  Center(
                    child: Text(
                      "Please Provide the Food Preferences",
                      style: TextStyle(
                        fontSize: height * 0.010 + width * 0.02,
                        color: Colors.grey[400],
                        fontFamily: 'comfortaa',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: height * 0.12 + height * 0.01,
                  ),
                  Center(
                    child: Text(
                      "To get a Better Diet 🥙",
                      style: TextStyle(
                        fontSize: height * 0.010 + width * 0.02,
                        color: Colors.grey[400],
                        fontFamily: 'comfortaa',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Location :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Colors.white,
                    value: defaultLocation,
                    items: locationItems,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        defaultLocation = newvalue!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Food Type :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Colors.white,
                    value: defaultFoodItem,
                    items: foodTypeItems,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        defaultFoodItem = newvalue!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Food Taste:",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Colors.white,
                    value: defaultFoodtaste,
                    items: tastes,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        defaultFoodtaste = newvalue!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Do You Smoke? :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Colors.white,
                    value: defaultSmoke,
                    items: smoke,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        defaultSmoke = newvalue!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Do You Drink Alcohol? :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Colors.white,
                    value: defaultAlcohol,
                    items: alcohol,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        defaultAlcohol = newvalue!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Comorbidities? :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Colors.white,
                    value: defaultComorb,
                    items: comorb,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        defaultComorb = newvalue!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Allergies? :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    dropdownColor: Colors.white,
                    value: defaultAllergy,
                    items: allergy,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.black,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        defaultAllergy = newvalue!;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02 + width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.3 + height * 0.01),
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
                      onPressed: () {
                        _ref = firebaseInstance
                            .ref()
                            .child('${user!.uid}/preference');
                        _ref.set({
                          "Location": defaultLocation,
                          "Food Item": defaultFoodItem,
                          "Food Taste": defaultFoodtaste,
                          "Smoke": defaultSmoke,
                          "Alcohol": defaultAlcohol,
                          "Comorbities": defaultComorb,
                          "Allergies": defaultAllergy,
                        }).asStream();
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
                                fontSize: height * 0.015 + width * 0.01,
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
                ],
              ),
            ],
          ),
        ),
      );
    } else if (Platform.isIOS) {
      List locationList = <String>[
        "North India",
        "South India",
      ];

      List foodTypeList = <String>[
        "Vegetarian",
        "NonVeg",
      ];

      List foodTasteList = <String>[
        "Sweet",
        "Sour",
        "Salty",
        "Bitter",
        "Pungent",
        "Astringent",
      ];

      List yesOrNo = <String>[
        "Yes",
        "No",
      ];

      List comorBities = <String>[
        "None",
        "High-BP",
        "HyperTension",
        "Diabetes",
        "Cardio",
      ];

      List allergies = <String>[
        "None",
        "Dairy allergies",
        "Fish allergies",
        "Tree nuts allergies",
      ];
      return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.03 + width * 0.1,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.001 + height * 0.001,
                  ),
                  CupertinoButton(
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.black,
                        size: height * 0.03 + width * 0.01,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/homepage');
                      }),
                  SizedBox(
                    width: width * 0.13 + height * 0.01,
                  ),
                  Center(
                    child: Text(
                      "Food Preference",
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
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: height * 0.05 + height * 0.01,
                  ),
                  Center(
                    child: Text(
                      "Please Provide the Food Preferences",
                      style: TextStyle(
                        fontSize: height * 0.010 + width * 0.02,
                        color: Colors.grey[400],
                        fontFamily: 'comfortaa',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: height * 0.12 + height * 0.01,
                  ),
                  Center(
                    child: Text(
                      "To get a Better Diet 🥙",
                      style: TextStyle(
                        fontSize: height * 0.010 + width * 0.02,
                        color: Colors.grey[400],
                        fontFamily: 'comfortaa',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.07 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Location :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.15 + height * 0.01,
                  ),
                  CupertinoButton(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: height * 0.3 + width * 0.01,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: [
                            Text(
                              "North India",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "South India",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _location = value;
                            });
                          },
                        ),
                      ),
                    ),
                    child: Text(locationList[_location]),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Food Type :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.12 + height * 0.01,
                  ),
                  CupertinoButton(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: height * 0.3 + width * 0.01,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: [
                            Text(
                              "Vegetarian",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "NonVeg",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _foodType = value;
                            });
                          },
                        ),
                      ),
                    ),
                    child: Text(foodTypeList[_foodType]),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Taste :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.22 + height * 0.01,
                  ),
                  CupertinoButton(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: height * 0.3 + width * 0.01,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: [
                            Text(
                              "Sweet",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Sour",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Salty",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Bitter",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Pungent",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Astringent",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _foodTaste = value;
                            });
                          },
                        ),
                      ),
                    ),
                    child: Text(foodTasteList[_foodTaste]),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Do You Smoke ?:",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02 + height * 0.01,
                  ),
                  CupertinoButton(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: height * 0.3 + width * 0.01,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: [
                            Text(
                              "Yes",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "No",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _youSmoke = value;
                            });
                          },
                        ),
                      ),
                    ),
                    child: Text(yesOrNo[_youSmoke]),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Do You Drink ?:",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05 + height * 0.01,
                  ),
                  CupertinoButton(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: height * 0.3 + width * 0.01,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: [
                            Text(
                              "Yes",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "No",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _youAlcoholic = value;
                            });
                          },
                        ),
                      ),
                    ),
                    child: Text(yesOrNo[_youAlcoholic]),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Comorbidities? :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.006,
                  ),
                  CupertinoButton(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: height * 0.3 + width * 0.01,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: [
                            Text(
                              "None",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "High-BP",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Hyper Tension",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Diabetes",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Cardio",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _comorb = value;
                            });
                          },
                        ),
                      ),
                    ),
                    child: Text(comorBities[_comorb]),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width * 0.07 + height * 0.01,
                  ),
                  Text(
                    "Allergies? :",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'comfortaa',
                      fontSize: width * 0.02 + height * 0.01,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01 + height * 0.01,
                  ),
                  CupertinoButton(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.infinity,
                        height: height * 0.3 + width * 0.01,
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: [
                            Text(
                              "None",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Dairy allergies",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Fish allergies",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Tree nuts allergies",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'comfortaa',
                                fontSize: width * 0.03 + height * 0.01,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          onSelectedItemChanged: (value) {
                            setState(() {
                              _allergies = value;
                            });
                          },
                        ),
                      ),
                    ),
                    child: Text(allergies[_allergies]),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02 * width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.3 + height * 0.01),
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
                      onPressed: () {},
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
                                fontSize: height * 0.015 + width * 0.01,
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
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: Text("Platform Not Supported"),
      );
    }
  }
}
