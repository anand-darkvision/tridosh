import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LunchWarn extends StatefulWidget {
  const LunchWarn({super.key});

  @override
  State<LunchWarn> createState() => _LunchWarnState();
}

class _LunchWarnState extends State<LunchWarn> {
  late SharedPreferences pref;
  late String bodyType;
  Map<int, Map<String, dynamic>> nutritionDataBreakfast = {};
  Map<String, int> foodData = {};
  User? user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    pref = await SharedPreferences.getInstance();
    bodyType = pref.getString("BodyType") ?? "";

    final ref = FirebaseDatabase.instance.ref();
    final snapshotBreakfast = await ref.child('${user!.uid}/breakfast').get();

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
      print('No Food available for Lunch.');
    }

    await loadCsvData();
  }

  Future<void> loadCsvData() async {
    final csvData = await loadDataFromAssets('Assets/Data/finalfoodis.csv');

    if (csvData != null) {
      for (List<dynamic> row in csvData) {
        String foodName = row[0].toString().toLowerCase();
        int suitability = int.parse(row[28].toString());
        foodData[foodName] = suitability;
      }
    } else {
      print('Error loading CSV data.');
    }
  }

  bool isFoodSuitable(String foodName) {
    int suitability = foodData[foodName.toLowerCase()] ?? 0;
    return suitability != 1;
  }

  Future<List<List<dynamic>>?> loadDataFromAssets(String assetPath) async {
    try {
      final data = await rootBundle.loadString(assetPath);
      final csv = CsvToListConverter();
      return csv.convert(data);
    } catch (e) {
      print('Error loading CSV data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
