import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Service/diet.dart'; // Replace with the actual import path

class WeeklyDiet extends StatefulWidget {
  const WeeklyDiet({Key? key});

  @override
  State<WeeklyDiet> createState() => _WeeklyDietState();
}

class _WeeklyDietState extends State<WeeklyDiet> {
  String? bodyType;
  late List<String> mondayDietBreakfast;
  late List<String> mondayDietLunch;
  late List<String> mondayDietSnacks;
  late List<String> mondayDietDinner;
  late String dietPlanKey; // Key to store and check diet plan for the week
  late int storedWeekNumber;

  User? user = FirebaseAuth.instance.currentUser!;
  final database = FirebaseDatabase.instance;

  // Method to fetch and store the Monday diet recommendations
  Future<void> getMondayDiet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      bodyType = pref.getString("BodyType");
    });

    if (bodyType == null) {
      bodyType = "Find Body type to View Food";
    }

    // Use the intl package to calculate the week number
    final DateTime now = DateTime.now();
    final int weekNumber =
        (now.difference(DateTime(now.year)).inDays / 7).ceil();

    // Generate a key for this week's diet plan
    dietPlanKey = "DietPlan_${DateTime.now().year}_Week_$weekNumber";

    // Check if the diet plan for this week already exists
    if (pref.getString(dietPlanKey) == null) {
      // If not, generate a new diet plan for this week
      mondayDietBreakfast = await getFoodRecommendations(
        time: 'breakfast',
        bodyType: bodyType!,
        disabilities: [],
      );
      mondayDietLunch = await getFoodRecommendations(
        time: 'lunch',
        bodyType: bodyType!,
        disabilities: [],
      );
      mondayDietSnacks = await getFoodRecommendations(
        time: 'snack',
        bodyType: bodyType!,
        disabilities: [],
      );
      mondayDietDinner = await getFoodRecommendations(
        time: 'dinner',
        bodyType: bodyType!,
        disabilities: [],
      );

      // Store the randomly selected food items for a week
      final random = Random();
      final mondayBreakfast =
          mondayDietBreakfast[random.nextInt(mondayDietBreakfast.length)];
      final mondayLunch =
          mondayDietLunch[random.nextInt(mondayDietLunch.length)];
      final mondaySnacks =
          mondayDietSnacks[random.nextInt(mondayDietSnacks.length)];
      final mondayDinner =
          mondayDietDinner[random.nextInt(mondayDietDinner.length)];

      pref.setString("MondayBreakfast", mondayBreakfast);
      pref.setString("MondayLunch", mondayLunch);
      pref.setString("MondaySnacks", mondaySnacks);
      pref.setString("MondayDinner", mondayDinner);

      // Store the current week number in SharedPreferences
      pref.setInt("CurrentWeek", weekNumber);
    } else {
      // If the diet plan for this week already exists, check if it's a new week
      storedWeekNumber = pref.getInt("CurrentWeek") ?? 0;
      final currentWeekNumber = weekNumber;

      if (currentWeekNumber != storedWeekNumber) {
        // If it's a new week, generate a new diet plan
        mondayDietBreakfast = await getFoodRecommendations(
          time: 'breakfast',
          bodyType: bodyType!,
          disabilities: [],
        );
        mondayDietLunch = await getFoodRecommendations(
          time: 'lunch',
          bodyType: bodyType!,
          disabilities: [],
        );
        mondayDietSnacks = await getFoodRecommendations(
          time: 'snack',
          bodyType: bodyType!,
          disabilities: [],
        );
        mondayDietDinner = await getFoodRecommendations(
          time: 'dinner',
          bodyType: bodyType!,
          disabilities: [],
        );

        // Store the randomly selected food items for a week
        final random = Random();
        final mondayBreakfast =
            mondayDietBreakfast[random.nextInt(mondayDietBreakfast.length)];
        final mondayLunch =
            mondayDietLunch[random.nextInt(mondayDietLunch.length)];
        final mondaySnacks =
            mondayDietSnacks[random.nextInt(mondayDietSnacks.length)];
        final mondayDinner =
            mondayDietDinner[random.nextInt(mondayDietDinner.length)];

        pref.setString("MondayBreakfast", mondayBreakfast);
        pref.setString("MondayLunch", mondayLunch);
        pref.setString("MondaySnacks", mondaySnacks);
        pref.setString("MondayDinner", mondayDinner);

        // Update the stored week number
        pref.setInt("CurrentWeek", currentWeekNumber);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getMondayDiet();
    // call();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
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
                  Navigator.pushReplacementNamed(context, '/maindiet');
                },
              ),
              SizedBox(
                width: width * 0.28 + height * 0.01,
              ),
              Center(
                child: Text(
                  "Monday",
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
            height: height * 0.07 + width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Eat for health",
                    style: TextStyle(
                      fontSize: height * 0.02 + width * 0.02,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Comfortaa",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.07 + width * 0.01,
              ),
              // Display the breakfast recommendation
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.03 + height * 0.01,
                  ),
                  Text(
                    "Breakfast : ",
                    style: TextStyle(
                      fontSize: height * 0.012 + width * 0.02,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Comfortaa",
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: FutureBuilder<String>(
                      future: SharedPreferences.getInstance().then((pref) {
                        return pref.getString("MondayBreakfast") ??
                            "No data in pref";
                      }),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                              fontSize: height * 0.012 + width * 0.02,
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
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              // Display lunch, snacks, and dinner recommendations here
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.03 + height * 0.01,
                  ),
                  Text(
                    "Lunch : ",
                    style: TextStyle(
                      fontSize: height * 0.012 + width * 0.02,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Comfortaa",
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: FutureBuilder<String>(
                      future: SharedPreferences.getInstance().then((pref) {
                        return pref.getString("MondayLunch") ??
                            "No data in pref";
                      }),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                              fontSize: height * 0.012 + width * 0.02,
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
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.03 + height * 0.01,
                  ),
                  Text(
                    "Snacks : ",
                    style: TextStyle(
                      fontSize: height * 0.012 + width * 0.02,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Comfortaa",
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: FutureBuilder<String>(
                      future: SharedPreferences.getInstance().then((pref) {
                        return pref.getString("MondaySnacks") ??
                            "No data in pref";
                      }),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                              fontSize: height * 0.012 + width * 0.02,
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
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.03 + height * 0.01,
                  ),
                  Text(
                    "Dinner : ",
                    style: TextStyle(
                      fontSize: height * 0.012 + width * 0.02,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Comfortaa",
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: FutureBuilder<String>(
                      future: SharedPreferences.getInstance().then((pref) {
                        return pref.getString("MondayDinner") ??
                            "No data in pref";
                      }),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                              fontSize: height * 0.012 + width * 0.02,
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}