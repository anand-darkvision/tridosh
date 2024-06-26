import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Warning extends StatefulWidget {
  const Warning({super.key});

  @override
  State<Warning> createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Platform.isAndroid
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
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
                      width: width * 0.2 + height * 0.01,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05 + width * 0.01,
                ),
                Text(
                  "Be Careful With What You Eat!",
                  style: TextStyle(
                    fontSize: height * 0.020 + width * 0.02,
                    color: Colors.black,
                    fontFamily: "signikasemdibold",
                  ),
                ),
                SizedBox(
                  height: height * 0.05 + width * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
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
                          Navigator.pushNamed(context, '/mondaywarn');
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
                                  color: const Color(0xFF9e9ac6),
                                  fontSize: height * 0.01 + width * 0.009,
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
                          Navigator.pushNamed(context, '/tuesdaydiet');
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
                                  color: const Color(0xFF9e9ac6),
                                  fontSize: height * 0.01 + width * 0.01,
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
                SizedBox(
                  height: height * 0.05 + width * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
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
                          Navigator.pushNamed(context, '/wednesdaydiet');
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: height * 0.001 + width * 0.001,
                              ),
                              Text(
                                'Snacks',
                                style: TextStyle(
                                  color: const Color(0xFF9e9ac6),
                                  fontSize: height * 0.01 + width * 0.01,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                color: const Color(0xFF9e9ac6),
                                size: height * 0.015 + width * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
                          Navigator.pushNamed(context, '/thursdaydiet');
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
                                  color: const Color(0xFF9e9ac6),
                                  fontSize: height * 0.01 + width * 0.01,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                color: const Color(0xFF9e9ac6),
                                size: height * 0.015 + width * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1 + width * 0.01,
                ),
                SizedBox(
                  height: height * 0.1 + width * 0.01,
                ),
                Center(
                  child: Container(
                    width: width * 0.6 + height * 0.1,
                    height: height * 0.25 + width * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('Assets/image/eat.png'),
                      ),
                    ),
                  ),
                )
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
                        "Weekly Diet",
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
                Text(
                  "You are what you eat!",
                  style: TextStyle(
                    fontSize: height * 0.025 + width * 0.02,
                    color: CupertinoColors.black,
                    fontFamily: "signikasemibold",
                  ),
                ),
                SizedBox(
                  height: height * 0.05 + width * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushNamed(context, '/weeklydiet');
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: height * 0.01 + width * 0.002,
                            ),
                            Text(
                              'Monday',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: height * 0.013 + width * 0.01,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.systemGrey,
                              size: height * 0.020 + width * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushNamed(context, '/tuesdaydiet');
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: height * 0.01 + width * 0.002,
                            ),
                            Text(
                              'Tuesday',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: height * 0.013 + width * 0.01,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.systemGrey,
                              size: height * 0.020 + width * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02 + width * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushNamed(context, '/wednesdaydiet');
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: height * 0.01 + width * 0.002,
                            ),
                            Text(
                              'Wednesday',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: height * 0.013 + width * 0.01,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.systemGrey,
                              size: height * 0.020 + width * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushNamed(context, '/thursdaydiet');
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: height * 0.01 + width * 0.002,
                            ),
                            Text(
                              'Thursday',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: height * 0.013 + width * 0.01,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: CupertinoColors.systemGrey,
                              size: height * 0.020 + width * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.2 + width * 0.01,
                ),
                Center(
                  child: Container(
                    width: width * 0.4 + height * 0.1,
                    height: height * 0.35 + width * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('Assets/image/eat.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
