import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Service/diet.dart';

class WednesdayDiet extends StatefulWidget {
  const WednesdayDiet({super.key});

  @override
  State<WednesdayDiet> createState() => _WednesdayDietState();
}

class _WednesdayDietState extends State<WednesdayDiet> {
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
  late List<String> wednesdayDietBreakfast;
  late List<String> wednesdayDietLunch;
  late List<String> wednesdayDietSnacks;
  late List<String> wednesdayDietDinner;
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
    final lastPlanDateString = prefs.getString('lastPlanDateWednesday');
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
    wednesdayDietBreakfast = await getFoodRecommendations(
      time: 'breakfast',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );
    wednesdayDietLunch = await getFoodRecommendations(
      time: 'lunch',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );
    wednesdayDietSnacks = await getFoodRecommendations(
      time: 'snack',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );
    wednesdayDietDinner = await getFoodRecommendations(
      time: 'dinner',
      bodyType: bodyType!,
      disabilities: [comorbities, alco, smok],
    );

    final random = Random();

    final wednesdayDiet_breakfast =
        wednesdayDietBreakfast[random.nextInt(wednesdayDietBreakfast.length)];
    final wednesdayDiet_lunch =
        wednesdayDietLunch[random.nextInt(wednesdayDietLunch.length)];
    final wednesdayDiet_snacks =
        wednesdayDietSnacks[random.nextInt(wednesdayDietSnacks.length)];
    final wednesdayDiet_dinner =
        wednesdayDietDinner[random.nextInt(wednesdayDietDinner.length)];

    pref.setString('wednesdayBreakfast', jsonEncode(wednesdayDiet_breakfast));
    pref.setString('wednesdayLunch', jsonEncode(wednesdayDiet_lunch));
    pref.setString('wednesdaySnacks', jsonEncode(wednesdayDiet_snacks));
    pref.setString('wednesdayDinner', jsonEncode(wednesdayDiet_dinner));
    pref.setString('lastPlanDateWednesday', now.toIso8601String());
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
                      "Wednesday",
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
              buildDietRow("Breakfast", "wednesdayBreakfast"),
              buildDietRow("Lunch", "wednesdayLunch"),
              buildDietRow("Snacks", "wednesdaySnacks"),
              buildDietRow("Dinner", "wednesdayDinner"),
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
