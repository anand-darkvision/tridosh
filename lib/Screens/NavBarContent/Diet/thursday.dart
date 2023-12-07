import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Service/diet.dart';

class ThursdayDiet extends StatefulWidget {
  const ThursdayDiet({super.key});

  @override
  State<ThursdayDiet> createState() => _ThursdayDietState();
}

class _ThursdayDietState extends State<ThursdayDiet> {
  late String location = '';
  late String foodItem = '';
  late String foodTaste = '';
  late String smoke = '';
  late String alcohol = '';
  late String comorbities = '';
  late String allergies = '';
  String alco = "";
  String smok = "";
  String? bodyType;
  late List<String> thursdayDietBreakfast;
  late List<String> thursdayDietLunch;
  late List<String> thursdayDietSnacks;
  late List<String> thursdayDietDinner;
  late int storedWeekNumber;

  User? user = FirebaseAuth.instance.currentUser!;
  final database = FirebaseDatabase.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    generateDietPlanIfNeeded();
  }

  Future<void> generateDietPlanIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    final lastPlanDateString = prefs.getString('lastPlanDateThursday');
    DateTime? lastPlanDate;
    if (lastPlanDateString != null) {
      lastPlanDate = DateTime.parse(lastPlanDateString);
    }
    final now = DateTime.now();
    if (lastPlanDate == null || now.difference(lastPlanDate).inDays > 7) {
      await generateNewDietPlan();
    }
  }

  Future<void> generateNewDietPlan() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final now = DateTime.now();
    setState(() {
      bodyType = pref.getString("BodyType");
    });
    try {
      DocumentSnapshot docSnapshot = await firebaseFirestore
          .collection('users')
          .doc(user!.email)
          .collection('preference')
          .doc('pref')
          .get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          location = data['Location'];
          foodItem = data['Food Item'];
          foodTaste = data['Food Taste'];
          smoke = data['Smoke'];
          alcohol = data['Alcohol'];
          comorbities = data['Comorbities'];
          allergies = data['Allergies'];
        });
      } else {
        print('No preferences found for this user.');
      }
    } catch (e) {
      print('Error fetching preferences: $e');
    }

    if (bodyType == null) {
      bodyType = "Find Body type to View Food";
    }
    if (alcohol == "Yes") {
      setState(() {
        alco = "Alcoholic";
      });
    }
    if (smoke == "Yes") {
      setState(() {
        smok = "Smoker";
      });
    }
    thursdayDietBreakfast = await getFoodRecommendations(
      time: 'breakfast',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );
    thursdayDietLunch = await getFoodRecommendations(
      time: 'lunch',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );
    thursdayDietSnacks = await getFoodRecommendations(
      time: 'snack',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );
    thursdayDietDinner = await getFoodRecommendations(
      time: 'dinner',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );

    final random = Random();

    final thursdayDiet_breakfast =
        thursdayDietBreakfast[random.nextInt(thursdayDietBreakfast.length)];
    final thursdayDiet_lunch =
        thursdayDietLunch[random.nextInt(thursdayDietLunch.length)];
    final thursdayDiet_snacks =
        thursdayDietSnacks[random.nextInt(thursdayDietSnacks.length)];
    final thursdayDiet_dinner =
        thursdayDietDinner[random.nextInt(thursdayDietDinner.length)];

    pref.setString('thursdayBreakfast', jsonEncode(thursdayDiet_breakfast));
    pref.setString('thursdayLunch', jsonEncode(thursdayDiet_lunch));
    pref.setString('thursdaySnacks', jsonEncode(thursdayDiet_snacks));
    pref.setString('thursdayDinner', jsonEncode(thursdayDiet_dinner));
    pref.setString('lastPlanDateThursday', now.toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height * 0.02),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: height * 0.03 + width * 0.01,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/maindiet');
                    },
                  ),
                  SizedBox(width: width * 0.22 + height * 0.01),
                  Center(
                    child: Text(
                      "Thursday",
                      style: TextStyle(
                        fontSize: height * 0.015 + width * 0.02,
                        color: Colors.black,
                        fontFamily: "Comfortaa",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Text(
                "Eat for health",
                style: TextStyle(
                  fontSize: height * 0.02 + width * 0.02,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.03),
              buildDietRow("Breakfast", "thursdayBreakfast"),
              buildDietRow("Lunch", "thursdayLunch"),
              buildDietRow("Snacks", "thursdaySnacks"),
              buildDietRow("Dinner", "thursdayDinner"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDietRow(String label, String prefKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label :",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: "Comfortaa",
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        FutureBuilder<String>(
          future: SharedPreferences.getInstance().then((pref) {
            return pref.getString(prefKey) ?? "No data in preferences";
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Text(
                snapshot.data!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Comfortaa",
                  color: Colors.black45,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return Text("No data available.");
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
