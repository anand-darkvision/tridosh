// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class BreakFastRecaller extends StatefulWidget {
  const BreakFastRecaller({Key? key}) : super(key: key);

  @override
  State<BreakFastRecaller> createState() => _BreakFastRecallerState();
}

class _BreakFastRecallerState extends State<BreakFastRecaller> {
  User? user = FirebaseAuth.instance.currentUser!;
  final fb = FirebaseDatabase.instance;
  var l, g, k;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('${user!.uid}/breakfast');

    return FirebaseAnimatedList(
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          //screen height and width
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          var v = snapshot.value.toString();
          g = v.replaceAll(RegExp("{|}|count: |name: "), "");
          g.trim();
          l = g.split(',');
          return Card(
            elevation: 5, // Add a subtle shadow to the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
            ),
            child: Container(
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(
                        0xFF91C788), // Replace this with your desired gradient colors
                    Color(0xFF5A9653),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: width * 0.01 +
                          height * 0.01), // Adjust the spacing as needed
                  Row(
                    children: [
                      SizedBox(width: width * 0.01 + height * 0.01),
                      Text(
                        "Food Name: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "signikasemibold",
                          fontSize: 18.0, // Adjust the font size
                        ),
                      ),
                      Text(
                        l[2],
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontFamily: "signikasemibold",
                          fontSize: 18.0, // Adjust the font size
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0), // Adjust the spacing as needed
                  Row(
                    children: [
                      SizedBox(width: 10.0),
                      Text(
                        "Servings: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "signikasemibold",
                          fontSize: 18.0, // Adjust the font size
                        ),
                      ),
                      Text(
                        l[1],
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontFamily: "signikasemibold",
                          fontSize: 18.0, // Adjust the font size
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0), // Adjust the spacing as needed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30.0, // Adjust the icon size
                        ),
                        onPressed: () {
                          ref.child(snapshot.key!).remove();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
