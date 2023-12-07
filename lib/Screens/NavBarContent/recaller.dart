// ignore_for_file: use_build_context_synchronously
import 'package:dietrecall/Screens/NavBarContent/RecallPages/BreakFastRecaller.dart';
import 'package:dietrecall/Screens/NavBarContent/RecallPages/DinnerRecaller.dart';
import 'package:dietrecall/Screens/NavBarContent/RecallPages/LunchRecaller.dart';
import 'package:dietrecall/Screens/NavBarContent/RecallPages/SnacksRecaller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Recaller extends StatefulWidget {
  const Recaller({Key? key}) : super(key: key);

  @override
  State<Recaller> createState() => _RecallerState();
}

class _RecallerState extends State<Recaller> {
  //firebase reference
  User? user = FirebaseAuth.instance.currentUser!;
  late DatabaseReference _ref;
  // screnns
  List screens = [
    const BreakFastRecaller(),
    const LunchRecaller(),
    const SnacksRecaller(),
    const DinnerRecaller(),
  ];
  //screen index
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _ref = FirebaseDatabase.instance.ref().child(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.04 + width * 0.01,
          ),
          Row(
            children: [
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
                width: width * 0.24 + height * 0.01,
              ),
              Text(
                "Recaller",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.015 + width * 0.02,
                    fontFamily: "Comfortaa"),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01 + width * 0.01,
          ),
          Container(
            height: height * 0.09 + width * 0.01,
            width: width * 0.39 + height * 0.25,
            decoration: BoxDecoration(
              color: const Color(0xFFfe8573),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.03 + height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.003 + width * 0.1,
                        width: height * 0.02 + width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: const Color(0xFFfef9eb),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: height * 0.01 + width * 0.002,
                                ),
                                Text(
                                  'BreakFast',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: height * 0.012 + width * 0.01,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.grey[700],
                                  size: height * 0.012 + width * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.03 + height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.003 + width * 0.1,
                        width: height * 0.02 + width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: const Color(0xFFfef9eb),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: height * 0.01 + width * 0.002,
                                ),
                                Text(
                                  'Lunch',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: height * 0.013 + width * 0.01,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.grey[700],
                                  size: height * 0.020 + width * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.03 + height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.003 + width * 0.1,
                        width: height * 0.02 + width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: const Color(0xFFfef9eb),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 2;
                            });
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: height * 0.01 + width * 0.002,
                                ),
                                Text(
                                  'Snacks',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: height * 0.013 + width * 0.01,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.grey[700],
                                  size: height * 0.020 + width * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.03 + height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.003 + width * 0.1,
                        width: height * 0.02 + width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: const Color(0xFFfef9eb),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 3;
                            });
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: height * 0.01 + width * 0.002,
                                ),
                                Text(
                                  'Dinner',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: height * 0.013 + width * 0.01,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.grey[700],
                                  size: height * 0.020 + width * 0.01,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.03 + height * 0.02,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01 + width * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Swipe",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: height * 0.013 + width * 0.01,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: height * 0.01 + width * 0.02,
                color: Colors.grey[700],
              ),
              SizedBox(
                width: width * 0.03 + height * 0.03,
              ),
            ],
          ),
          //body content
          //
          SizedBox(
            height: height * 0.01 + width * 0.01,
          ),
          Container(
            width: width * 0.3 + height * 0.3,
            height: height * 0.6 + width * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFFeff7ee)),
            child: screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
