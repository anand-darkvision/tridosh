import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Service/diet.dart';

class TuesdayDiet extends StatefulWidget {
  const TuesdayDiet({super.key});

  @override
  State<TuesdayDiet> createState() => _TuesdayDietState();
}

class _TuesdayDietState extends State<TuesdayDiet> {
  String? bodyType;
  late List<String> tuesdayDietBreakfast;
  late List<String> tuesdayDietLunch;
  late List<String> tuesdayDietSnacks;
  late List<String> tuesdayDietDinner;
  late String
      tuesdayDietPlanKey; // Key to store and check diet plan for the week
  late int tuesdayStoredWeekNumber; // Week number stored in SharedPreferences

  // Method to fetch and store the Monday diet recommendations
  Future<void> getMondayDiet() async {
    print("Get monday diet function working");
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
    tuesdayDietPlanKey = "DietPlan_${DateTime.now().year}_Week_$weekNumber";

    // Check if the diet plan for this week already exists
    if (pref.getString(tuesdayDietPlanKey) == null) {
      // If not, generate a new diet plan for this week
      tuesdayDietBreakfast = await getFoodRecommendations(
        time: 'breakfast',
        bodyType: bodyType!,
        disabilities: [],
      );
      tuesdayDietLunch = await getFoodRecommendations(
        time: 'lunch',
        bodyType: bodyType!,
        disabilities: [],
      );
      tuesdayDietSnacks = await getFoodRecommendations(
        time: 'snack',
        bodyType: bodyType!,
        disabilities: [],
      );
      tuesdayDietDinner = await getFoodRecommendations(
        time: 'dinner',
        bodyType: bodyType!,
        disabilities: [],
      );

      // Store the randomly selected food items for a week
      final random = Random();
      final tuesdayBreakfast =
          tuesdayDietBreakfast[random.nextInt(tuesdayDietBreakfast.length)];
      final tuesdayLunch =
          tuesdayDietLunch[random.nextInt(tuesdayDietLunch.length)];
      final tuesdaySnacks =
          tuesdayDietSnacks[random.nextInt(tuesdayDietSnacks.length)];
      final tuesdayDinner =
          tuesdayDietDinner[random.nextInt(tuesdayDietDinner.length)];

      pref.setString("TuesdayBreakfast", tuesdayBreakfast);
      pref.setString("TuesdayLunch", tuesdayLunch);
      pref.setString("TuesdaySnacks", tuesdaySnacks);
      pref.setString("TuesdayDinner", tuesdayDinner);

      // Store the current week number in SharedPreferences
      pref.setInt("TuesdayCurrentWeek", weekNumber);
    } else {
      // If the diet plan for this week already exists, check if it's a new week
      tuesdayStoredWeekNumber = pref.getInt("TuesdayCurrentWeek") ?? 0;
      final tuesdayCurrentWeekNumber = weekNumber;

      if (tuesdayCurrentWeekNumber != tuesdayStoredWeekNumber) {
        // If it's a new week, generate a new diet plan
        tuesdayDietBreakfast = await getFoodRecommendations(
          time: 'breakfast',
          bodyType: bodyType!,
          disabilities: [],
        );
        tuesdayDietLunch = await getFoodRecommendations(
          time: 'lunch',
          bodyType: bodyType!,
          disabilities: [],
        );
        tuesdayDietSnacks = await getFoodRecommendations(
          time: 'snack',
          bodyType: bodyType!,
          disabilities: [],
        );
        tuesdayDietDinner = await getFoodRecommendations(
          time: 'dinner',
          bodyType: bodyType!,
          disabilities: [],
        );

        // Store the randomly selected food items for a week
        final random = Random();
        final tuesdayBreakfast =
            tuesdayDietBreakfast[random.nextInt(tuesdayDietBreakfast.length)];
        final tuesdayLunch =
            tuesdayDietLunch[random.nextInt(tuesdayDietLunch.length)];
        final tuesdaySnacks =
            tuesdayDietSnacks[random.nextInt(tuesdayDietSnacks.length)];
        final tuesdayDinner =
            tuesdayDietDinner[random.nextInt(tuesdayDietDinner.length)];

        pref.setString("TuesdayBreakfast", tuesdayBreakfast);
        pref.setString("TuesdayLunch", tuesdayLunch);
        pref.setString("TuesdaySnacks", tuesdaySnacks);
        pref.setString("TuesdayDinner", tuesdayDinner);

        // Update the stored week number
        pref.setInt("TuesdayCurrentWeek", tuesdayCurrentWeekNumber);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getMondayDiet();
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
                width: width * 0.23 + height * 0.01,
              ),
              Center(
                child: Text(
                  "Tuesday",
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
                    "Fuel your body",
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
                        return pref.getString("TuesdayBreakfast") ?? "Error";
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
                        return pref.getString("TuesdayLunch") ?? "Error";
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
                        return pref.getString("TuesdaySnacks") ?? "Error";
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
                        return pref.getString("TuesdayDinner") ?? "Error";
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
