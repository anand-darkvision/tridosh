import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Provider/Register_user_model.dart';
import '../../Provider/google_sign_in.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String? bodyType;
  User? user = FirebaseAuth.instance.currentUser!;
  RegisterUserModel loggedInUser = RegisterUserModel();

  @override
  void initState() {
    super.initState();
    getValue();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.email)
        .get()
        .then((value) {
      loggedInUser = RegisterUserModel.fromMap(value.data());
      setState(() {});
    });
  }

  //image
  AssetImage image = const AssetImage("Assets/image/user.png");

  @override
  Widget build(BuildContext context) {
    //screen size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //profile photo
    NetworkImage network = NetworkImage("${user?.photoURL}");
    dynamic profileObject =
        "${loggedInUser.name}".endsWith("null") ? network : image;
    // user name
    var nameValue = ("${loggedInUser.name}".endsWith("null"))
        ? "${user?.displayName}"
        : "${loggedInUser.name}";
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05 + width * 0.01,
            ),
            Text(
              "Profile",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: 'Comfortaa',
                  fontSize: height * 0.02 + width * 0.01),
            ),
            SizedBox(
              height: height * 0.03 + width * 0.01,
            ),
            CircleAvatar(
              foregroundImage: profileObject,
              radius: height * 0.09 + width * 0.001,
            ),
            SizedBox(
              height: height * 0.02 + width * 0.01,
            ),
            Text(
              nameValue,
              style: TextStyle(
                fontSize: height * 0.03 + width * 0.03,
                fontFamily: 'signikaregular',
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              height: height * 0.01 + width * 0.01,
            ),
            Text(
              bodyType == null ? "Body Type Not Found" : "$bodyType",
              style: TextStyle(
                fontSize: height * 0.01 + width * 0.02,
                fontFamily: 'signikaregular',
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: height * 0.03 + width * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/report');
              },
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.07 + height * 0.01,
                    ),
                    Container(
                      width: width * 0.05 + height * 0.05,
                      height: height * 0.05 + width * 0.05,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("Assets/image/report.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05 + height * 0.01,
                    ),
                    Text(
                      "Get Report",
                      style: TextStyle(
                        fontSize: height * 0.014 + width * 0.02,
                        fontFamily: 'Comfortaa',
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.25 + height * 0.01,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey[600],
                      size: height * 0.04 + width * 0.01,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03 + width * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/recaller');
              },
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.07 + height * 0.01,
                    ),
                    Container(
                      width: width * 0.05 + height * 0.05,
                      height: height * 0.05 + width * 0.05,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("Assets/image/recall.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05 + height * 0.01,
                    ),
                    Text(
                      "Recaller",
                      style: TextStyle(
                        fontSize: height * 0.014 + width * 0.02,
                        fontFamily: 'Comfortaa',
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.25 + height * 0.04,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey[600],
                      size: height * 0.04 + width * 0.01,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03 + width * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/preference');
              },
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.07 + height * 0.01,
                    ),
                    Container(
                      width: width * 0.05 + height * 0.05,
                      height: height * 0.05 + width * 0.05,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("Assets/image/setting.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05 + height * 0.01,
                    ),
                    Text(
                      "Preference",
                      style: TextStyle(
                        fontSize: height * 0.014 + width * 0.02,
                        fontFamily: 'Comfortaa',
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.18 + height * 0.04,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey[600],
                      size: height * 0.04 + width * 0.01,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02 + width * 0.02,
            ),
            SizedBox(
              height: height * 0.005 + width * 0.01,
              width: width * 0.3 + height * 0.3,
              child: Divider(
                color: Colors.grey[200],
                thickness: 1,
              ),
            ),
            SizedBox(
              height: height * 0.013 + width * 0.02,
            ),
            GestureDetector(
              onTap: () async {
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();
                pref.remove("mondayBreakfast");
                pref.remove("mondayLunch");
                pref.remove("mondaySnacks");
                pref.remove("mondayDinner");
                pref.remove("lastPlanDateMonday");
                pref.remove("BodyType");
                pref.remove("tuesdayBreakfast");
                pref.remove("tuesdayLunch");
                pref.remove("tuesdaySnacks");
                pref.remove("tuesdayDinner");
                pref.remove("lastPlanDateTuesday");
                pref.remove("wednesdayBreakfast");
                pref.remove("wednesdayLunch");
                pref.remove("wednesdaySnacks");
                pref.remove("wednesdayDinner");
                pref.remove("lastPlanDateWednesday");
                pref.remove("thursdayBreakfast");
                pref.remove("thursdayLunch");
                pref.remove("thursdaySnacks");
                pref.remove("thursdayDinner");
                pref.remove("lastPlanDateThursday");
                pref.remove("fridayBreakfast");
                pref.remove("fridayLunch");
                pref.remove("fridaySnacks");
                pref.remove("fridayDinner");
                pref.remove("lastPlanDateFriday");
                pref.remove("saturdayBreakfast");
                pref.remove("saturdayLunch");
                pref.remove("saturdaySnacks");
                pref.remove("saturdayDinner");
                pref.remove("lastPlanDateSaturday");
                pref.remove("sundayBreakfast");
                pref.remove("sundayLunch");
                pref.remove("sundaySnacks");
                pref.remove("sundayDinner");
                pref.remove("lastPlanDateSunday");
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logOut(context);
              },
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.07 + height * 0.01,
                    ),
                    Container(
                      width: width * 0.05 + height * 0.05,
                      height: height * 0.05 + width * 0.05,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("Assets/image/logout.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05 + height * 0.01,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: height * 0.014 + width * 0.02,
                        fontFamily: 'Comfortaa',
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.25 + height * 0.05,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey[600],
                      size: height * 0.04 + width * 0.01,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getValue() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bodyType = pref.getString("BodyType");
    setState(() {});
  }
}
