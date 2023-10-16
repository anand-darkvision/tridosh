import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import the functions for data retrieval
import '../Service/diet.dart'; // Replace with the actual import path

class WeeklyDiet extends StatefulWidget {
  const WeeklyDiet({Key? key});

  @override
  State<WeeklyDiet> createState() => _WeeklyDietState();
}

class _WeeklyDietState extends State<WeeklyDiet> {
  String? bodyType;
  //breakfast
  late Future<List<String>> mondayDietBreakFast;
  late Future<List<String>> mondayDietLunch;
  late Future<List<String>> mondayDietSnacks;
  late Future<List<String>> mondayDietDinner;

  // Method to fetch the Monday breakfast diet recommendations
  Future<void> getMondayBreakfastDiet() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      bodyType = pref.getString("BodyType");
    });
    mondayDietBreakFast = getFoodRecommendations(
      time: 'breakfast', // Set the time to 'breakfast'
      bodyType: bodyType == null ? "Find Body type to View Food" : "$bodyType",
      disabilities: [],
    );
    mondayDietLunch = getFoodRecommendations(
      time: 'lunch',
      bodyType: bodyType == null ? "Find Body type to View Food" : "$bodyType",
      disabilities: [],
    );
    mondayDietSnacks = getFoodRecommendations(
      time: 'snack',
      bodyType: bodyType == null ? "Find Body type to View Food" : "$bodyType",
      disabilities: [],
    );
    mondayDietDinner = getFoodRecommendations(
      time: 'dinner',
      bodyType: bodyType == null ? "Find Body type to View Food" : "$bodyType",
      disabilities: [],
    );
  }

  @override
  void initState() {
    super.initState();
    getMondayBreakfastDiet(); // Fetch the Monday breakfast diet recommendations
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
                  Navigator.pushReplacementNamed(context, '/homepage');
                },
              ),
              SizedBox(
                width: width * 0.28 + height * 0.01,
              ),
              Center(
                child: Text(
                  "Diet",
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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amberAccent,
                  Colors
                      .yellow, // Replace this with your desired gradient color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            height: height * 0.37 + width * 0.02,
            width: height * 0.45 + width * 0.02,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01 + width * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.03 + height * 0.01,
                    ),
                    Text(
                      "Monday",
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
                  height: height * 0.03 + width * 0.01,
                ),
                // Display the breakfast recommendation
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03 + height * 0.01,
                    ),
                    Text(
                      "Breakfast: ",
                      style: TextStyle(
                        fontSize: height * 0.012 + width * 0.02,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Comfortaa",
                        color: Colors.black,
                      ),
                    ),
                    Flexible(
                      child: FutureBuilder<List<String>>(
                        future: mondayDietBreakFast,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            return Text(
                              "${snapshot.data![0]}",
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
                  height: height * 0.03 + width * 0.01,
                ),
                // Display the breakfast recommendation
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03 + height * 0.01,
                    ),
                    Text(
                      "Lunch: ",
                      style: TextStyle(
                        fontSize: height * 0.012 + width * 0.02,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Comfortaa",
                        color: Colors.black,
                      ),
                    ),
                    Flexible(
                      child: FutureBuilder<List<String>>(
                        future: mondayDietLunch,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            return Text(
                              "${snapshot.data![0]}",
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
                  height: height * 0.03 + width * 0.01,
                ),
                // Display the breakfast recommendation
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03 + height * 0.01,
                    ),
                    Text(
                      "Snacks: ",
                      style: TextStyle(
                        fontSize: height * 0.012 + width * 0.02,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Comfortaa",
                        color: Colors.black,
                      ),
                    ),
                    Flexible(
                      child: FutureBuilder<List<String>>(
                        future: mondayDietSnacks,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            return Text(
                              "${snapshot.data![0]}",
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
                  height: height * 0.03 + width * 0.01,
                ),
                // Display the breakfast recommendation
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03 + height * 0.01,
                    ),
                    Text(
                      "Dinner: ",
                      style: TextStyle(
                        fontSize: height * 0.012 + width * 0.02,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Comfortaa",
                        color: Colors.black,
                      ),
                    ),
                    Flexible(
                      child: FutureBuilder<List<String>>(
                        future: mondayDietDinner,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            return Text(
                              "${snapshot.data![0]}",
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
          ),
        ],
      ),
    );
  }
}
