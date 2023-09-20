// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class LunchRecaller extends StatefulWidget {
  const LunchRecaller({Key? key}) : super(key: key);

  @override
  State<LunchRecaller> createState() => _LunchRecallerState();
}

class _LunchRecallerState extends State<LunchRecaller> {
  User? user = FirebaseAuth.instance.currentUser!;
  final fb = FirebaseDatabase.instance;
  var l, g, k;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('${user!.uid}/lunch');
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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: width * 0.25 + height * 0.25,
                  height: height * 0.15 + width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 145, 199, 136),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.01 + width * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.03 + height * 0.02,
                          ),
                          Text(
                            "FoodName : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "signikasemibold",
                              fontSize: height * 0.015 + width * 0.015,
                            ),
                          ),
                          Text(
                            l[1],
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontFamily: "signikasemibold",
                              fontSize: height * 0.015 + width * 0.015,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02 + width * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.03 + height * 0.02,
                          ),
                          Text(
                            "Servings : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "signikasemibold",
                              fontSize: height * 0.015 + width * 0.015,
                            ),
                          ),
                          Text(
                            l[0],
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontFamily: "signikasemibold",
                              fontSize: height * 0.015 + width * 0.015,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03 + width * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.3 + height * 0.13,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: height * 0.04 + width * 0.01,
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
              ),
            ],
          );
        });
  }
}
