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
  late Future<List<String>> mondayDiet;

  // Method to fetch the user's body type from SharedPreferences
  Future<void> getBodyType() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      bodyType = pref.getString("BodyType");
    });
  }

  // Method to fetch the Monday breakfast diet recommendations
  Future<void> getMondayBreakfastDiet() async {
    mondayDiet = getFoodRecommendations(
      time: 'breakfast', // Set the time to 'breakfast'
      bodyType: bodyType ?? "",
      disabilities: [],
    );
  }

  @override
  void initState() {
    super.initState();
    getBodyType();
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
                  Colors.amber,
                  Colors
                      .amberAccent, // Replace this with your desired gradient color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            height: height * 0.3 + width * 0.02,
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
                  children: [
                    SizedBox(
                      width: width * 0.03 + height * 0.01,
                    ),
                    FutureBuilder<List<String>>(
                      future: mondayDiet,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          return Text(
                            "Breakfast: ${snapshot.data![0]}",
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
                  ],
                ),

                // ... Continue displaying other meal recommendations ...
              ],
            ),
          ),
        ],
      ),
    );
  }
}
