import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodWarn extends StatefulWidget {
  const FoodWarn({super.key});

  @override
  State<FoodWarn> createState() => _FoodWarnState();
}

class _FoodWarnState extends State<FoodWarn> {
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
      print('No data available for breakfast.');
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Food Consumption Page',
          style: TextStyle(
              fontSize: height * 0.01 + width * 0.03,
              fontFamily: "signikaregular",
              color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/homepage');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: nutritionDataBreakfast.isEmpty
          ? Center(
              child: Text(
              'No data available for breakfast.',
              style: TextStyle(
                  fontSize: height * 0.01 + width * 0.03,
                  fontFamily: "signikaregular",
                  color: Colors.grey[600]),
            ))
          : ListView.builder(
              itemCount: nutritionDataBreakfast.length,
              itemBuilder: (context, index) {
                Map<String, dynamic>? foodData = nutritionDataBreakfast[index];
                String foodName = foodData?['name'];
                String foodCount = foodData?['count'];
                String date = foodData?['date'];

                if (!isFoodSuitable(foodName)) {
                  return Card(
                    child: ListTile(
                      title: Text('Food: $foodName'),
                      subtitle: Text('Count: $foodCount\nDate: $date'),
                    ),
                  );
                } else {
                  // Food is suitable, you can handle this case as needed
                  return Container();
                }
              },
            ),
    );
  }
}
