import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    //screen size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.07 + width * 0.01,
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
                  width: width * 0.01 + height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFfe8573),
                  ),
                  width: width * 0.4 + height * 0.16,
                  height: height * 0.07 + height * 0.01,
                  child: Center(
                    child: Text(
                      "Report",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.015 + width * 0.02,
                          fontFamily: "Comfortaa"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01 + width * 0.01,
            ),
            Container(
              width: width * 0.3 + height * 0.3,
              height: height * 0.7 + width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFeff7ee)),
            ),
          ],
        ),
      ),
    );
  }
}
