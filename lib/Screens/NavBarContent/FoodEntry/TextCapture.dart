import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TextCapture extends StatefulWidget {
  const TextCapture({Key? key}) : super(key: key);

  @override
  State<TextCapture> createState() => _TextCaptureState();
}

class _TextCaptureState extends State<TextCapture> {
  final TextEditingController _foodName = TextEditingController();
  final TextEditingController _foodCount = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser!;
  late DatabaseReference _ref;
  final firebaseInstance = FirebaseDatabase.instance;
  bool value1 = false;
  double val1 = -1.0;

  var calories = 0.0;
  var totalFat = 0.0;

  DateTime currentDate = DateTime.now();

  void showFlushBar(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: const Color.fromARGB(255, 58, 62, 89),
      duration: const Duration(seconds: 1),
      icon: const Icon(
        Icons.warning_amber_sharp,
        color: Colors.white,
      ),
      titleText: const Text(
        'Select Option',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'signikasemibold',
        ),
      ),
      message: "Select Option Below",
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
    ).show(context);
  }

  Future<void> fetchFoodInfo(String query) async {
    final String url =
        'https://trackapi.nutritionix.com/v2/search/instant?query=$query&detailed=true';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-app-id': 'e975eb9b',
      'x-app-key': '4a2e8dd857e4dce2a9873762e19cf980',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final commonFoods = data['common'] as List<dynamic>;

        if (commonFoods.isNotEmpty) {
          final food = commonFoods.first;
          setState(() {
            calories = food['full_nutrients']
                .firstWhere((nutrient) => nutrient['attr_id'] == 208)['value']
                .toDouble();
            totalFat = food['full_nutrients']
                .firstWhere((nutrient) => nutrient['attr_id'] == 204)['value']
                .toDouble();
          });

          print('Calories: $calories, Total Fat: $totalFat');
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      // Handle exceptions here
      print('Error: $e');
      // Show an error message or handle the error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (Platform.isAndroid) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01 + width * 0.01,
            ),
            Text(
              "Enter Food Through",
              style: TextStyle(
                fontFamily: "signikaregular",
                fontSize: height * 0.04 + width * 0.01,
                color: Colors.grey[600],
              ),
            ),
            Text(
              "Text",
              style: TextStyle(
                fontFamily: "signikaregular",
                fontSize: height * 0.04 + width * 0.01,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: height * 0.03 + width * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Breakfast",
                      style: TextStyle(
                        fontFamily: "signikaregular",
                        fontSize: height * 0.02 + width * 0.01,
                        color: Colors.grey[600],
                      ),
                    ),
                    Radio(
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
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Lunch",
                      style: TextStyle(
                        fontFamily: "signikaregular",
                        fontSize: height * 0.02 + width * 0.01,
                        color: Colors.grey[600],
                      ),
                    ),
                    Radio(
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
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01 + width * 0.01,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: width * 0.11 + height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      "Snacks",
                      style: TextStyle(
                        fontFamily: "signikaregular",
                        fontSize: height * 0.02 + width * 0.01,
                        color: Colors.grey[600],
                      ),
                    ),
                    Radio(
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
                  ],
                ),
                SizedBox(
                  width: width * 0.13 + height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      "Dinner",
                      style: TextStyle(
                        fontFamily: "signikaregular",
                        fontSize: height * 0.02 + width * 0.01,
                        color: Colors.grey[600],
                      ),
                    ),
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      value: 3.0,
                      groupValue: val1,
                      onChanged: (value1) {
                        setState(() {
                          val1 = value1 as double;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05 + width * 0.01,
            ),
            SizedBox(
              height: height * 0.07 + width * 0.01,
              width: width * 0.3 + height * 0.25,
              child: TextFormField(
                minLines: null,
                maxLines: null,
                expands: true,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.black),
                controller: _foodName,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _foodName.text = value!;
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
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
                  hintText: 'Food Name',
                  hintStyle: TextStyle(color: Colors.grey[500]),
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
            SizedBox(
              height: height * 0.05 + width * 0.01,
            ),
            SizedBox(
              height: height * 0.07 + width * 0.01,
              width: width * 0.3 + height * 0.25,
              child: TextFormField(
                minLines: null,
                maxLines: null,
                expands: true,
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: Colors.black),
                controller: _foodCount,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _foodCount.text = value!;
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
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
                  hintText: 'Food Count',
                  hintStyle: TextStyle(color: Colors.grey[500]),
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
            SizedBox(
              height: height * 0.01 + width * 0.06,
            ),
            SizedBox(
              height: height * 0.07 + width * 0.01,
              width: width * 0.3 + height * 0.25,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: const Color.fromARGB(255, 145, 199, 136),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                onPressed: () async {
                  final query = _foodName.text;
                  await fetchFoodInfo(query);

                  // Rest of the code for saving data in the database
                  if (val1 == 0.0) {
                    _ref = firebaseInstance
                        .ref()
                        .child('${user!.uid}/breakfast/$k');
                    _ref.set({
                      "name": _foodName.text,
                      "count": _foodCount.text,
                      "calories": calories, // Provide the actual value
                      "totalFat": totalFat,
                      "date": currentDate, // Provide the actual value
                    }).asStream();
                    _foodName.clear();
                    _foodCount.clear();
                    setState(() {
                      val1 = -1.0;
                    });
                  } else if (val1 == 1.0) {
                    _ref =
                        firebaseInstance.ref().child('${user!.uid}/lunch/$k');
                    _ref.set({
                      "name": _foodName.text,
                      "count": _foodCount.text,
                      "calories": calories,
                      "totalFat": totalFat,
                      "date": currentDate,
                    }).asStream();
                    _foodName.clear();
                    _foodCount.clear();
                    setState(() {
                      val1 = -1.0;
                    });
                  } else if (val1 == 2) {
                    _ref =
                        firebaseInstance.ref().child('${user!.uid}/snacks/$k');
                    _ref.set({
                      "name": _foodName.text,
                      "count": _foodCount.text,
                      "calories": calories,
                      "totalFat": totalFat,
                      "date": currentDate,
                    }).asStream();
                    _foodName.clear();
                    _foodCount.clear();
                    setState(() {
                      val1 = -1.0;
                    });
                  } else if (val1 == 3) {
                    _ref =
                        firebaseInstance.ref().child('${user!.uid}/dinner/$k');
                    _ref.set({
                      "name": _foodName.text,
                      "count": _foodCount.text,
                      "calories": calories,
                      "totalFat": totalFat,
                      "date": currentDate,
                    }).asStream();
                    _foodName.clear();
                    _foodCount.clear();
                    setState(() {
                      val1 = -1.0;
                    });
                  } else {
                    showFlushBar(context);
                  }
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: height * 0.01 + width * 0.002,
                      ),
                      Text(
                        'Enter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.02 + width * 0.01,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_rounded,
                        color: Colors.white,
                        size: height * 0.04 + width * 0.01,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (Platform.isIOS) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.01 + width * 0.01),
            Text(
              "Enter Food Through",
              style: TextStyle(
                fontFamily: "signikaregular",
                fontSize: height * 0.04 + width * 0.01,
                color: Colors.grey[600],
              ),
            ),
            Text(
              "Text",
              style: TextStyle(
                fontFamily: "signikaregular",
                fontSize: height * 0.04 + width * 0.01,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: height * 0.0 + width * 0.00),
            CupertinoFormSection(
              backgroundColor: Colors.transparent,
              decoration: BoxDecoration(
                border: Border.all(
                  // Customize the border color
                  width: 2.0, // Customize the border width
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              children: [
                CupertinoFormRow(
                  prefix: const Text("Breakfast"),
                  child: CupertinoRadio<int>(
                    activeColor: const Color.fromARGB(255, 145, 199, 136),
                    value: 0,
                    groupValue: val1.toInt(),
                    onChanged: (value) {
                      setState(() {
                        val1 = value!.toDouble();
                      });
                    },
                  ),
                ),
                CupertinoFormRow(
                  prefix: const Text("Lunch"),
                  child: CupertinoRadio<int>(
                    activeColor: const Color.fromARGB(255, 145, 199, 136),
                    value: 1,
                    groupValue: val1.toInt(),
                    onChanged: (value) {
                      setState(() {
                        val1 = value!.toDouble();
                      });
                    },
                  ),
                ),
                CupertinoFormRow(
                  prefix: Text("Snacks"),
                  child: CupertinoRadio<int>(
                    activeColor: const Color.fromARGB(255, 145, 199, 136),
                    value: 2,
                    groupValue: val1.toInt(),
                    onChanged: (value) {
                      setState(() {
                        val1 = value!.toDouble();
                      });
                    },
                  ),
                ),
                CupertinoFormRow(
                  prefix: const Text("Dinner"),
                  child: CupertinoRadio<int>(
                    activeColor: const Color.fromARGB(255, 145, 199, 136),
                    value: 3,
                    groupValue: val1.toInt(),
                    onChanged: (value) {
                      setState(() {
                        val1 = value!.toDouble();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.05 + width * 0.01),
            SizedBox(
              height: height * 0.07 + width * 0.01,
              width: width * 0.3 + height * 0.25,
              child: CupertinoTextField(
                minLines: null,
                maxLines: null,
                expands: true,
                placeholder: 'Food Name',
                controller: _foodName,
                style: const TextStyle(color: CupertinoColors.black),
                keyboardType: TextInputType.text,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: height * 0.05 + width * 0.01),
            SizedBox(
              height: height * 0.07 + width * 0.01,
              width: width * 0.3 + height * 0.25,
              child: CupertinoTextField(
                minLines: null,
                maxLines: null,
                expands: true,
                placeholder: 'Food Count',
                controller: _foodCount,
                style: const TextStyle(color: CupertinoColors.black),
                keyboardType: TextInputType.text,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: height * 0.01 + width * 0.06),
            SizedBox(
              height: height * 0.03 + width * 0.1,
              width: height * 0.1 + width * 0.3,
              child: Container(
                // (unchanged code)
                child: CupertinoButton(
                  onPressed: () async {
                    final query = _foodName.text;
                    await fetchFoodInfo(query);

                    // Rest of the code for saving data in the database
                    if (val1 == 0) {
                      _ref = firebaseInstance
                          .ref()
                          .child('${user!.uid}/breakfast/$k');
                      _ref.set({
                        "date": currentDate,
                        "name": _foodName.text,
                        "count": _foodCount.text,
                        "calories": calories,
                        "totalFat": totalFat,
                      }).asStream();
                      _foodName.clear();
                      _foodCount.clear();
                      setState(() {
                        val1 = -1.0;
                      });
                    } else if (val1 == 1) {
                      _ref =
                          firebaseInstance.ref().child('${user!.uid}/lunch/$k');
                      _ref.set({
                        "date": currentDate,
                        "name": _foodName.text,
                        "count": _foodCount.text,
                        "calories": calories,
                        "totalFat": totalFat,
                      }).asStream();
                      _foodName.clear();
                      _foodCount.clear();
                      setState(() {
                        val1 = -1.0;
                      });
                    } else if (val1 == 2) {
                      _ref = firebaseInstance
                          .ref()
                          .child('${user!.uid}/snacks/$k');
                      _ref.set({
                        "date": currentDate,
                        "name": _foodName.text,
                        "count": _foodCount.text,
                        "calories": calories,
                        "totalFat": totalFat,
                      }).asStream();
                      _foodName.clear();
                      _foodCount.clear();
                      setState(() {
                        val1 = -1.0;
                      });
                    } else if (val1 == 3) {
                      _ref = firebaseInstance
                          .ref()
                          .child('${user!.uid}/dinner/$k');
                      _ref.set({
                        "date": currentDate,
                        "name": _foodName.text,
                        "count": _foodCount.text,
                        "calories": calories,
                        "totalFat": totalFat,
                      }).asStream();
                      _foodName.clear();
                      _foodCount.clear();
                      setState(() {
                        val1 = -1.0;
                      });
                    } else {
                      return;
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: height * 0.01 + width * 0.002),
                      Text(
                        'Enter',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: height * 0.02 + width * 0.01,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: CupertinoColors.white,
                        size: height * 0.04 + width * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text("Platform not supported"),
      );
    }
  }
}
