import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../Provider/Register_user_model.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late String location = '';
  late String foodItem = '';
  late String foodTaste = '';
  late String smoke = '';
  late String alcohol = '';
  late String comorbities = '';
  late String allergies = '';
  String? bodyType;
  var nameValue = '';

  User? user = FirebaseAuth.instance.currentUser!;
  final database = FirebaseDatabase.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RegisterUserModel loggedInUser = RegisterUserModel();

  final pdf = pw.Document();

  writeOnPdf() async {
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
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.email)
          .get()
          .then((value) {
        loggedInUser = RegisterUserModel.fromMap(value.data());
        setState(() {});
      });

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
    Map<int, Map<String, dynamic>> nutritionDataBreakfast = {};
    Map<int, Map<String, dynamic>> nutritionDataLunch = {};
    Map<int, Map<String, dynamic>> nutritionDataSnacks = {};
    Map<int, Map<String, dynamic>> nutritionDataDinner = {};

    try {
      final ref = FirebaseDatabase.instance.ref();
      final snapshotBreakfast = await ref.child('${user!.uid}/breakfast').get();
      final snapshotLunch = await ref.child('${user!.uid}/lunch').get();
      final snapshotSnacks = await ref.child('${user!.uid}/snacks').get();
      final snapshotDinner = await ref.child('${user!.uid}/dinner').get();

      if (snapshotBreakfast.exists) {
        setState(() {
          nutritionDataBreakfast = Map<int, Map<String, dynamic>>.from(
            (snapshotBreakfast.value as Map<dynamic, dynamic>).map(
              (key, value) => MapEntry(
                int.parse(key.toString()),
                Map<String, dynamic>.from(value),
              ),
            ),
          );
        });
      } else {
        print('No data available for breakfast.');
      }

      if (snapshotLunch.exists) {
        setState(() {
          nutritionDataLunch = Map<int, Map<String, dynamic>>.from(
            (snapshotLunch.value as Map<dynamic, dynamic>).map(
              (key, value) => MapEntry(
                int.parse(key.toString()),
                Map<String, dynamic>.from(value),
              ),
            ),
          );
        });
      } else {
        print('No data available for Lunch.');
      }

      if (snapshotSnacks.exists) {
        setState(() {
          nutritionDataSnacks = Map<int, Map<String, dynamic>>.from(
            (snapshotSnacks.value as Map<dynamic, dynamic>).map(
              (key, value) => MapEntry(
                int.parse(key.toString()),
                Map<String, dynamic>.from(value),
              ),
            ),
          );
        });
      } else {
        print('No data available for breakfast.');
      }

      if (snapshotDinner.exists) {
        setState(() {
          nutritionDataDinner = Map<int, Map<String, dynamic>>.from(
            (snapshotDinner.value as Map<dynamic, dynamic>).map(
              (key, value) => MapEntry(
                int.parse(key.toString()),
                Map<String, dynamic>.from(value),
              ),
            ),
          );
        });
      } else {
        print('No data available for Lunch.');
      }
    } catch (e) {
      print('Error fetching breakfast data: $e');
    }

    pw.Widget generateBreakfastTable() {
      List<pw.TableRow> tableRows = [];
      tableRows.add(
        pw.TableRow(
          children: [
            pw.Text('Food Name',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Food Count',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Calories',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Fat', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
      );

      // Add data rows
      nutritionDataBreakfast.forEach((key, value) {
        tableRows.add(
          pw.TableRow(
            children: [
              pw.Text(value['name'].toString()),
              pw.Text(value['count'].toString()),
              pw.Text(value['calories'].toString()),
              pw.Text(value['totalFat'].toString()),
            ],
          ),
        );
      });

      return pw.Table(
        border: pw.TableBorder.all(),
        children: tableRows,
      );
    }

    pw.Widget generateLunchTable() {
      List<pw.TableRow> tableRows = [];
      tableRows.add(
        pw.TableRow(
          children: [
            pw.Text('Food Name',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Food Count',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Calories',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Fat', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
      );

      // Add data rows
      nutritionDataLunch.forEach((key, value) {
        tableRows.add(
          pw.TableRow(
            children: [
              pw.Text(value['name'].toString()),
              pw.Text(value['count'].toString()),
              pw.Text(value['calories'].toString()),
              pw.Text(value['totalFat'].toString()),
            ],
          ),
        );
      });

      return pw.Table(
        border: pw.TableBorder.all(),
        children: tableRows,
      );
    }

    pw.Widget generateSnacksTable() {
      List<pw.TableRow> tableRows = [];
      tableRows.add(
        pw.TableRow(
          children: [
            pw.Text('Food Name',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Food Count',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Calories',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Fat', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
      );

      // Add data rows
      nutritionDataSnacks.forEach((key, value) {
        tableRows.add(
          pw.TableRow(
            children: [
              pw.Text(value['name'].toString()),
              pw.Text(value['count'].toString()),
              pw.Text(value['calories'].toString()),
              pw.Text(value['totalFat'].toString()),
            ],
          ),
        );
      });

      return pw.Table(
        border: pw.TableBorder.all(),
        children: tableRows,
      );
    }

    pw.Widget generateDinnerTable() {
      List<pw.TableRow> tableRows = [];
      tableRows.add(
        pw.TableRow(
          children: [
            pw.Text('Food Name',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Food Count',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Calories',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Fat', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
      );

      // Add data rows
      nutritionDataDinner.forEach((key, value) {
        tableRows.add(
          pw.TableRow(
            children: [
              pw.Text(value['name'].toString()),
              pw.Text(value['count'].toString()),
              pw.Text(value['calories'].toString()),
              pw.Text(value['totalFat'].toString()),
            ],
          ),
        );
      });

      return pw.Table(
        border: pw.TableBorder.all(),
        children: tableRows,
      );
    }

    String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          setState(() {
            nameValue = ("${loggedInUser.name}".endsWith("null"))
                ? "${user?.displayName}"
                : "${loggedInUser.name}";
          });
          return <pw.Widget>[
            pw.Header(level: 0, child: pw.Text("DIET REPORT")),
            pw.Header(level: 1, child: pw.Text("Date: $cdate")),
            pw.Header(level: 2, child: pw.Text("Name: $nameValue")),
            pw.Header(level: 3, child: pw.Text("BodyType : $bodyType")),
            pw.Header(level: 4, child: pw.Text("\n")),
            pw.Header(
              level: 5,
              child: pw.Text(
                "Preferences:",
                style: pw.TextStyle(
                  fontSize: 14,
                  fontBold: pw.Font(),
                ),
              ),
            ),
            pw.Paragraph(text: "\n"),
            pw.Paragraph(
                text:
                    "---------------------------------------------------------------------------------------"),
            pw.Paragraph(text: "\n"),
            pw.Paragraph(text: "Preferred Food Menu         : $location"),
            pw.Paragraph(text: "Veg (or) Non-Veg            : $foodItem"),
            pw.Paragraph(text: "Taste                       : $foodTaste"),
            pw.Paragraph(text: "Whether you smoke           : $smoke"),
            pw.Paragraph(text: "Whether you Drink(Alcohol)  : $alcohol"),
            pw.Paragraph(text: "Comorbities                 : $comorbities"),
            pw.Paragraph(text: "Allergies                   : $allergies"),
            pw.Paragraph(text: "\n"),
            pw.Paragraph(
                text:
                    "---------------------------------------------------------------------------------------"),
            pw.Paragraph(text: "\n"),
            pw.Paragraph(text: "Diet Consumption By User For BreakFast"),
            generateBreakfastTable(),
            pw.Paragraph(text: "\n"),
            pw.Paragraph(text: "Diet Consumption By User For Lunch"),
            generateLunchTable(),
            pw.Paragraph(text: "\n"),
            pw.Paragraph(text: "Diet Consumption By User For Snacks"),
            generateSnacksTable(),
            pw.Paragraph(text: "\n"),
            pw.Paragraph(text: "Diet Consumption By User For Dinner"),
            generateDinnerTable(),
          ];
        },
      ),
    );
  }

  Future savePdf() async {
    File file = File("/storage/emulated/0/Download/report.pdf");
    file.writeAsBytesSync(List.from(await pdf.save()));
  }

  @override
  void initState() {
    writeOnPdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.07 + width * 0.01),
            Row(
              children: [
                SizedBox(width: width * 0.001 + height * 0.001),
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
                SizedBox(width: width * 0.01 + height * 0.01),
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
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                          fontSize: height * 0.02 + width * 0.01,
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: height * 0.01 + width * 0.01),
            Container(
              width: width * 0.3 + height * 0.3,
              height: height * 0.6 + width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFeff7ee)),
              child: FutureBuilder<bool>(
                future:
                    File("/storage/emulated/0/Download/report.pdf").exists(),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return SfPdfViewer.file(
                        File("/storage/emulated/0/Download/report.pdf"));
                  } else {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 340,
                          height: 400,
                          child: Image.asset("Assets/image/404.gif"),
                        ),
                        Text(
                          "Download Report",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.02 + width * 0.01,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            SizedBox(height: height * 0.03 + width * 0.01),
            Row(
              children: [
                SizedBox(
                  width: width * 0.015 + height * 0.01,
                ),
                SizedBox(
                  height: height * 0.0010 + width * 0.1,
                  width: height * 0.02 + width * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xFFfe8573),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    onPressed: () async {
                      await savePdf();
                      setState(() {});
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: height * 0.01 + width * 0.002,
                          ),
                          Text(
                            'Download',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.01 + width * 0.01,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                            size: height * 0.015 + width * 0.01,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.2 + height * 0.01,
                ),
                SizedBox(
                  height: height * 0.0010 + width * 0.1,
                  width: height * 0.02 + width * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xFFfe8573),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    onPressed: () async {
                      File file =
                          File("/storage/emulated/0/Download/report.pdf");
                      await file.delete();
                      setState(() {});
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: height * 0.01 + width * 0.002,
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.01 + width * 0.01,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                            size: height * 0.015 + width * 0.01,
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
      ),
    );
  }
}
