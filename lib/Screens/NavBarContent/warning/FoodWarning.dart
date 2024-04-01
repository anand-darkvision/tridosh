// import 'package:csv/csv.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../Service/diet.dart';
//
// class YourWidget extends StatefulWidget {
//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }
//
// class _YourWidgetState extends State<YourWidget> {
//   late List<List<dynamic>> csvData;
//   late Map<int, Map<String, dynamic>> nutritionDataBreakfast;
//   late String bodyType;
//
//   @override
//   void initState() {
//     super.initState();
//     loadCSV();
//     fetchDataFromDatabase();
//     fetchBodyType();
//   }
//
//   Future<void> loadCSV() async {
//     final String assetPath = "Assets/Data/finalfoodis.csv";
//     csvData = await loadDataFromAssets(assetPath) ?? [];
//   }
//
//   Future<void> fetchDataFromDatabase() async {
//     final ref = FirebaseDatabase.instance.ref();
//     final snapshotBreakfast = await ref.child('${user!.uid}/breakfast').get();
//
//     if (snapshotBreakfast.exists) {
//       setState(() {
//         nutritionDataBreakfast = Map<int, Map<String, dynamic>>.from(
//           (snapshotBreakfast.value as Map<dynamic, dynamic>).map(
//             (key, value) => MapEntry(
//               int.parse(key.toString()),
//               Map<String, dynamic>.from(value),
//             ),
//           ),
//         );
//       });
//     } else {
//       print('No data available for breakfast.');
//     }
//   }
//
//   Future<void> fetchBodyType() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     bodyType = pref.getString("BodyType") ?? "";
//   }
//
//   List<Map<String, dynamic>> getFilteredFoods() {
//     List<Map<String, dynamic>> filteredFoods = [];
//
//     for (int key in nutritionDataBreakfast.keys) {
//       final Map<String, dynamic> foodData = nutritionDataBreakfast[key]!;
//       final String foodName = foodData["foodName"];
//       final int count = foodData["count"];
//       final String date = foodData["date"];
//
//       // Find the corresponding row in the CSV for the given food and body type
//       final List<dynamic>? csvRow = csvData.firstWhere(
//         (row) => row[0] == foodName && row[28] == bodyType,
//         orElse: () => [],
//       );
//
//       // Check if the food is marked as -1 for the current body type
//       if (csvRow.isNotEmpty && csvRow.sublist(4, 28).contains(-1)) {
//         filteredFoods.add({
//           "foodName": foodName,
//           "count": count,
//           "date": date,
//         });
//       }
//     }
//
//     return filteredFoods;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> filteredFoods = getFilteredFoods();
//
//     if (filteredFoods.isEmpty) {
//       return Center(
//         child: Text("No relevant food found."),
//       );
//     }
//
//     return ListView.builder(
//       itemCount: filteredFoods.length,
//       itemBuilder: (context, index) {
//         final Map<String, dynamic> foodData = filteredFoods[index];
//         return Card(
//           child: ListTile(
//             title: Text(foodData["foodName"]),
//             subtitle:
//                 Text("Count: ${foodData["count"]}, Date: ${foodData["date"]}"),
//           ),
//         );
//       },
//     );
//   }
// }
