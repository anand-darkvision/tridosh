import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../Provider/Register_user_model.dart';

class House extends StatefulWidget {
  const House({Key? key}) : super(key: key);

  @override
  State<House> createState() => _HouseState();
}

class _HouseState extends State<House> {
  //firebase
  User? user = FirebaseAuth.instance.currentUser!;
  final database = FirebaseDatabase.instance;
  RegisterUserModel loggedInUser = RegisterUserModel();
  var auth = FirebaseAuth.instance;
  //initstate
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.email)
        .get()
        .then((value) {
      loggedInUser = RegisterUserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //firstname retrieval
    var nameValue = ("${loggedInUser.name}".endsWith("null"))
        ? "${user?.displayName}"
        : "${loggedInUser.name}";
    //preference check

    // screen height
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: height * 0.08 + width * 0.02,
        ),
        Text(
          "Hello $nameValue,",
          style: TextStyle(
            fontSize: height * 0.03 + width * 0.03,
            fontFamily: 'signikasemibold',
            color: const Color.fromARGB(255, 145, 199, 136),
          ),
        ),
        SizedBox(
          height: height * 0.02 + width * 0.01,
        ),
        Text(
          "Find, track and eat healthy food.",
          style: TextStyle(
              fontSize: height * 0.01 + width * 0.03,
              fontFamily: "signikaregular",
              color: Colors.grey[600]),
        ),
        SizedBox(height: height * 0.03 + width * 0.02),
        Container(
          width: width * 0.84 + height * 0.01,
          height: height * 0.27 + width * 0.01,
          decoration: BoxDecoration(
            color: const Color(0xFFfef9eb),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  SizedBox(height: height * 0.03 + width * 0.01),
                  Row(
                    children: [
                      Text(
                        'NUTRITION CHART',
                        style: TextStyle(
                          color: const Color(0xFFfe8573),
                          fontFamily: "signikaregular",
                          fontSize: height * 0.01 + width * 0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.015 + width * 0.01),
                  Row(
                    children: [
                      Text(
                        'The Daily Diet',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "signikaregular",
                          fontSize: height * 0.02 + width * 0.025,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.001 + width * 0.001),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.01 + height * 0.02,
                      ),
                      Text(
                        'Nutrition Value',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "signikaregular",
                          fontSize: height * 0.02 + width * 0.025,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.01 + width * 0.04),
                  Row(
                    children: [
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
                            Navigator.pushReplacementNamed(
                                context, '/nutrition');
                            // NotificationService().showNotification(
                            //     title: "Water Remainder",
                            //     body: "Don't forgot get hydrate");
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: height * 0.01 + width * 0.002,
                                ),
                                Text(
                                  'Read Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.013 + width * 0.01,
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
              SizedBox(
                width: width * 0.01 + height * 0.01,
              ),
              SizedBox(
                child: Image.asset("Assets/image/burger.png"),
              ),
            ],
          ),
        ),
        SizedBox(height: width * 0.01 + width * 0.07),
        Container(
          height: height * 0.005 + width * 0.2,
          width: width * 0.84 + height * 0.02,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("Assets/image/RectangleDesign.png"),
          )),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.01 + width * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: height * 0.02 + width * 0.02,
                      ),
                      Text(
                        "View Your",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "signikaregular",
                          fontSize: height * 0.014 + width * 0.025,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01 + width * 0.001,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: height * 0.02 + width * 0.02,
                      ),
                      Text(
                        "Weekly Diet",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "signikaregular",
                          fontSize: height * 0.014 + width * 0.025,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: width * 0.1 + height * 0.01),
              SizedBox(
                height: height * 0.0024 + width * 0.1,
                width: height * 0.018 + width * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/maindiet');
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: height * 0.01 + width * 0.002,
                        ),
                        Text(
                          'Read Now',
                          style: TextStyle(
                            color: const Color(0xFF9e9ac6),
                            fontSize: height * 0.013 + width * 0.01,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_rounded,
                          color: const Color(0xFF9e9ac6),
                          size: height * 0.020 + width * 0.01,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02 + width * 0.02,
        ),
        Row(
          children: [
            SizedBox(
              width: width * 0.011 + height * 0.011,
            ),
            Container(
              height: height * 0.16 + width * 0.01,
              width: width * 0.27 + height * 0.01,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("Assets/image/fruits.png")),
                color: const Color(0xFFfff2f0),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              width: width * 0.011 + height * 0.011,
            ),
            Container(
              height: height * 0.16 + width * 0.01,
              width: width * 0.27 + height * 0.01,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("Assets/image/vegetables.png")),
                color: const Color(0xFFeff6ef),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              width: width * 0.011 + height * 0.011,
            ),
            Container(
              height: height * 0.16 + width * 0.01,
              width: width * 0.27 + height * 0.01,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("Assets/image/Snacks.png")),
                color: const Color(0xFFfef8ea),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
