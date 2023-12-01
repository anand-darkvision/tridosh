import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Service/diet.dart'; // Replace with the actual import path

class WeeklyDiet extends StatefulWidget {
  const WeeklyDiet({Key? key});

  @override
  State<WeeklyDiet> createState() => _WeeklyDietState();
}

class _WeeklyDietState extends State<WeeklyDiet> {
  late String location = '';
  late String foodItem = '';
  late String foodTaste = '';
  late String smoke = '';
  late String alcohol = '';
  late String comorbities = '';
  late String allergies = '';
  String? bodyType;
  late List<String> mondayDietBreakfast;
  late List<String> mondayDietLunch;
  late List<String> mondayDietSnacks;
  late List<String> mondayDietDinner;
  late String dietPlanKey; // Key to store and check diet plan for the week
  late int storedWeekNumber;

  User? user = FirebaseAuth.instance.currentUser!;
  final database = FirebaseDatabase.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> getMondayDiet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
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

    print(
        "this is fetched outside ${location},${foodItem},${foodTaste},${smoke},${alcohol},${comorbities},${allergies}");

    // Use the intl package to calculate the week number
    final DateTime now = DateTime.now();
    final int weekNumber =
        (now.difference(DateTime(now.year)).inDays / 7).ceil();

    // Generate a key for this week's diet plan
    dietPlanKey = "DietPlan_${DateTime.now().year}_Week_$weekNumber";
    String alco = "";
    String smok = "";
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

    // Check if the diet plan for this week already exists
    if (pref.getString(dietPlanKey) == null) {
      // If not, generate a new diet plan for this week
      mondayDietBreakfast = await getFoodRecommendations(
        time: 'breakfast',
        bodyType: bodyType!,
        disabilities: [comorbities, alco, smok],
      );
      mondayDietLunch = await getFoodRecommendations(
        time: 'lunch',
        bodyType: bodyType!,
        disabilities: [comorbities, alco, smok],
      );
      mondayDietSnacks = await getFoodRecommendations(
        time: 'snack',
        bodyType: bodyType!,
        disabilities: [comorbities, alco, smok],
      );
      mondayDietDinner = await getFoodRecommendations(
        time: 'dinner',
        bodyType: bodyType!,
        disabilities: [comorbities, alco, smok],
      );

      // Store the randomly selected food items for a week
      final random = Random();

      mondayDietBreakfast.shuffle(random);
      final mondayBreakfast = mondayDietBreakfast[0];

      mondayDietLunch.shuffle(random);
      final mondayLunch = mondayDietLunch[0];

      mondayDietSnacks.shuffle(random);
      final mondaySnacks = mondayDietSnacks[0];

      mondayDietDinner.shuffle(random);
      final mondayDinner = mondayDietDinner[0];

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
          disabilities: [comorbities, alco, smok],
        );
        mondayDietLunch = await getFoodRecommendations(
          time: 'lunch',
          bodyType: bodyType!,
          disabilities: [comorbities, alco, smok],
        );
        mondayDietSnacks = await getFoodRecommendations(
          time: 'snack',
          bodyType: bodyType!,
          disabilities: [comorbities, alco, smok],
        );
        mondayDietDinner = await getFoodRecommendations(
          time: 'dinner',
          bodyType: bodyType!,
          disabilities: [comorbities, alco, smok],
        );

        // Store the randomly selected food items for a week
        final random = Random();

        mondayDietBreakfast.shuffle(random);
        final mondayBreakfast = mondayDietBreakfast[0];

        mondayDietLunch.shuffle(random);
        final mondayLunch = mondayDietLunch[0];

        mondayDietSnacks.shuffle(random);
        final mondaySnacks = mondayDietSnacks[0];

        mondayDietDinner.shuffle(random);
        final mondayDinner = mondayDietDinner[0];

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

    return Platform.isAndroid
        ? Scaffold(
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
                            future:
                                SharedPreferences.getInstance().then((pref) {
                              return pref.getString("MondayBreakfast") ??
                                  "No data in preferences";
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
                            future:
                                SharedPreferences.getInstance().then((pref) {
                              return pref.getString("MondayLunch") ??
                                  "No data in preferences";
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
                            future:
                                SharedPreferences.getInstance().then((pref) {
                              return pref.getString("MondaySnacks") ??
                                  "No data in preferences";
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
                            future:
                                SharedPreferences.getInstance().then((pref) {
                              return pref.getString("MondayDinner") ??
                                  "No data in preferences";
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
          )
        : CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02 + width * 0.1,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: width * 0.001 + height * 0.001,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/homepage');
                      },
                      child: Icon(
                        CupertinoIcons.back,
                        size: height * 0.03 + width * 0.01,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2 + height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "Monday Diet",
                        style: TextStyle(
                          fontSize: height * 0.015 + width * 0.02,
                          color: CupertinoColors.black,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05 + width * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Breakfast",
                      style: TextStyle(
                        fontSize: height * 0.02 + width * 0.02,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Comfortaa",
                        color: CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.07 + width * 0.01,
                ),
                FutureBuilder<String>(
                  future: SharedPreferences.getInstance().then((pref) {
                    return pref.getString("MondayBreakfast") ??
                        "No data in preferences";
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CupertinoActivityIndicator();
                    } else if (snapshot.hasData) {
                      return Text(
                        snapshot.data!,
                        style: TextStyle(
                          fontSize: height * 0.012 + width * 0.02,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Comfortaa",
                          color: CupertinoColors.black,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }
                    return Text("No data available.");
                  },
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
                      "Lunch : ",
                      style: TextStyle(
                        fontSize: height * 0.012 + width * 0.02,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Comfortaa",
                        color: CupertinoColors.black,
                      ),
                    ),
                    Flexible(
                      child: FutureBuilder<String>(
                        future: SharedPreferences.getInstance().then((pref) {
                          return pref.getString("MondayLunch") ??
                              "No data in preferences";
                        }),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CupertinoActivityIndicator();
                          } else if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: TextStyle(
                                fontSize: height * 0.012 + width * 0.02,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Comfortaa",
                                color: CupertinoColors.black,
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
                        color: CupertinoColors.black,
                      ),
                    ),
                    Flexible(
                      child: FutureBuilder<String>(
                        future: SharedPreferences.getInstance().then((pref) {
                          return pref.getString("MondaySnacks") ??
                              "No data in preferences";
                        }),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CupertinoActivityIndicator();
                          } else if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: TextStyle(
                                fontSize: height * 0.012 + width * 0.02,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Comfortaa",
                                color: CupertinoColors.black,
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
                        color: CupertinoColors.black,
                      ),
                    ),
                    Flexible(
                      child: FutureBuilder<String>(
                        future: SharedPreferences.getInstance().then((pref) {
                          return pref.getString("MondayDinner") ??
                              "No data in preferences";
                        }),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CupertinoActivityIndicator();
                          } else if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: TextStyle(
                                fontSize: height * 0.012 + width * 0.02,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Comfortaa",
                                color: CupertinoColors.black,
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
          );
  }
}
