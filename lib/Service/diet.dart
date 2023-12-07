import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

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

Future<List<String>> getFoodRecommendations(
    {required String time,
    required String bodyType,
    required List<String> disabilities}) async {
  List<List<dynamic>>? rawData =
      await loadDataFromAssets('Assets/Data/finalfoodis.csv');
  if (rawData == null) {
    return [];
  }

  List<Map<String, dynamic>> data = [];

  if (rawData.isNotEmpty) {
    List<String> headers = rawData[0].map((e) => e.toString()).toList();

    for (var i = 1; i < rawData.length; i++) {
      var row = rawData[i];
      var rowMap = <String, dynamic>{};
      for (var j = 0; j < headers.length && j < row.length; j++) {
        rowMap[headers[j]] = row[j];
      }
      data.add(rowMap);
    }
  }

  List<String> foods = [];

  late int timeIndex;

  switch (time) {
    case 'breakfast':
      timeIndex = 0;
      break;
    case 'lunch':
      timeIndex = 1;
      break;
    case 'dinner':
      timeIndex = 2;
      break;
    case 'snack':
      timeIndex = 3;
      break;
  }

  if (disabilities.isEmpty) {
    for (var item in data) {
      if (item['label'] == bodyType && item['time'] == timeIndex) {
        foods.add(item['food']);
      }
    }
  } else {
    if (disabilities.contains('Diabetes')) {
      for (var item in data) {
        if (item['label'] == bodyType &&
            item['time'] == timeIndex &&
            item['Diabetes'] != -1) {
          foods.add(item['food']);
        }
      }
    }

    if (disabilities.contains('Hypertension')) {
      for (var item in data) {
        if (item['label'] == bodyType &&
            item['time'] == timeIndex &&
            item['Hypertension'] != -1) {
          foods.add(item['food']);
        }
      }
    }

    if (disabilities.contains('Alcoholic')) {
      if (timeIndex == 3) {
        foods.addAll([
          'drumstick leaves spinach',
          'radish leaves spinach',
        ]);
      }
      for (var item in data) {
        if (item['label'] == bodyType && item['time'] == timeIndex) {
          foods.add(item['food']);
        }
      }
    }

    if (disabilities.contains('Smoker')) {
      if (timeIndex == 3) {
        foods.addAll([
          'drumstick leaves spinach',
          'radish leaves spinach',
          // other items
        ]);
      }
      for (var item in data) {
        if (item['label'] == bodyType && item['time'] == timeIndex) {
          foods.add(item['food']);
        }
      }
    }
  }

  return foods;
}
