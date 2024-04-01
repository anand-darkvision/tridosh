import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CameraCapture extends StatefulWidget {
  const CameraCapture({Key? key}) : super(key: key);

  @override
  State<CameraCapture> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<CameraCapture> {
  late File _image = File("Assets/image/Icecream.png");
  bool imageSelect = false;
  String result = '';
  List<Map<String, dynamic>> foodData = [];
  bool value1 = false;
  double val1 = -1.0;
  var calories = 0.0;
  var totalFat = 0.0;
  late DatabaseReference _ref;
  User? user = FirebaseAuth.instance.currentUser!;
  final firebaseInstance = FirebaseDatabase.instance;

  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future<void> saveFoodToFirebase(String mealType) async {
    var rng = Random();
    var k = rng.nextInt(10000);
    try {
      final String collectionPath = '${user!.uid}/$mealType/$k';
      _ref = firebaseInstance.ref().child(collectionPath);

      String date = DateFormat('yyyy-MM-dd').format(currentDate);

      for (int i = 0; i < foodData.length; i++) {
        fetchFoodInfo(foodData[i]["food"].toString());
        await _ref.set({
          "name": foodData[i]["food"],
          "count": foodData[i]["count"],
          "calories": calories, // Add your logic to get correct values
          "totalFat": totalFat,
          "date": date, // Add your logic to get correct values
        });
      }

      // Clear foodData and text fields after saving to Firebase
      setState(() {
        foodData.clear();
        val1 = -1.0;
      });
    } catch (e) {
      print('Error saving to Firebase: $e');
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final source = ImageSource.camera;
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (pickedFile != null) {
      File image = File(pickedFile.path);

      // Update UI with the selected image
      setState(() {
        _image = image;
      });
    }
    sendImageToAPI(_image);
  }

  Future<void> sendImageToAPI(File image) async {
    try {
      var uri = Uri.parse("https://r3onblrnr2nz.share.zrok.io/predict");

      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(await response.stream.bytesToString());

        // Print the entire JSON response for debugging
        print('JSON Response: $jsonResponse');

        // Check if the expected key exists in the JSON response
        if (jsonResponse.containsKey('result')) {
          Map<String, dynamic> objectCounts = jsonResponse['result'];

          // Update foodData with the new results
          List<Map<String, dynamic>> updatedFoodData = [];
          objectCounts.forEach((food, count) {
            updatedFoodData.add({"food": food, "count": count});
          });

          // Update UI with the new foodData
          setState(() {
            foodData = updatedFoodData;
          });
        } else {
          print('Error: "result" key not found in the JSON response');
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchFoodInfo(String query) async {
    final String url =
        'https://trackapi.nutritionix.com/v2/search/instant?query=$query&detailed=true';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-app-id': 'e975eb9b',
      'x-app-key': '4a2e8dd857e4dce2a9873762e19cf980',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final commonFoods = data['common'] as List<dynamic>;

        if (commonFoods.isNotEmpty) {
          final food = commonFoods.first;
          setState(() {
            calories = food['full_nutrients']
                .firstWhere((nutrient) => nutrient['attr_id'] == 208)['value']
                .toDouble();
            totalFat = food['full_nutrients']
                .firstWhere((nutrient) => nutrient['attr_id'] == 204)['value']
                .toDouble();
          });

          // print('Calories: $calories, Total Fat: $totalFat');
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      // Handle exceptions here
      print('Error: $e');
      // Show an error message or handle the error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * 0.05 + width * 0.01),
          Container(
            height: height * 0.25 + width * 0.01,
            width: width * 0.6 + height * 0.01,
            decoration: BoxDecoration(
              image: _image.existsSync()
                  ? DecorationImage(
                      fit: BoxFit.fill,
                      image: FileImage(_image),
                    )
                  : const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("Assets/image/Icecream.png"),
                    ),
            ),
          ),
          SizedBox(height: width * 0.1 + height * 0.01),
          Text(
            "Capture Food Through",
            style: TextStyle(
              fontFamily: "signikaregular",
              fontSize: height * 0.04 + width * 0.01,
              color: Colors.grey[600],
            ),
          ),
          Text(
            "Camera",
            style: TextStyle(
              fontFamily: "signikaregular",
              fontSize: height * 0.04 + width * 0.01,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: width * 0.1 + height * 0.01),
          SizedBox(
            height: height * 0.03 + width * 0.1,
            width: height * 0.1 + width * 0.3,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: const Color.fromARGB(255, 145, 199, 136),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                pickImage();
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: height * 0.01 + width * 0.002),
                    Text(
                      'Capture',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.02 + width * 0.01,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_rounded,
                      color: Colors.white,
                      size: height * 0.04 + width * 0.01,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03 + width * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    "Breakfast",
                    style: TextStyle(
                      fontFamily: "signikaregular",
                      fontSize: height * 0.02 + width * 0.01,
                      color: Colors.grey[600],
                    ),
                  ),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: 0.0,
                    groupValue: val1,
                    onChanged: (value1) {
                      setState(() {
                        val1 = value1 as double;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Lunch",
                    style: TextStyle(
                      fontFamily: "signikaregular",
                      fontSize: height * 0.02 + width * 0.01,
                      color: Colors.grey[600],
                    ),
                  ),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: 1.0,
                    groupValue: val1,
                    onChanged: (value1) {
                      setState(() {
                        val1 = value1 as double;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01 + width * 0.01,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.11 + height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "Snacks",
                    style: TextStyle(
                      fontFamily: "signikaregular",
                      fontSize: height * 0.02 + width * 0.01,
                      color: Colors.grey[600],
                    ),
                  ),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: 2.0,
                    groupValue: val1,
                    onChanged: (value1) {
                      setState(() {
                        val1 = value1 as double;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.13 + height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "Dinner",
                    style: TextStyle(
                      fontFamily: "signikaregular",
                      fontSize: height * 0.02 + width * 0.01,
                      color: Colors.grey[600],
                    ),
                  ),
                  Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    value: 3.0,
                    groupValue: val1,
                    onChanged: (value1) {
                      setState(() {
                        val1 = value1 as double;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: width * 0.05 + height * 0.01),
          Column(
            children: List.generate(
              foodData.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: '${foodData[index]["food"]}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                          decoration: InputDecoration(
                            labelText: 'Food Name',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "signikaregular",
                                fontSize: height * 0.025 + width * 0.01),
                          ),
                          onChanged: (value) {
                            setState(() {
                              foodData[index]["food"] = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          initialValue: '${foodData[index]["count"]}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                          decoration: InputDecoration(
                            labelText: 'Count',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: "signikaregular",
                                fontSize: height * 0.025 + width * 0.01),
                          ),
                          onChanged: (value) {
                            setState(() {
                              foodData[index]["count"] = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: height * 0.03 + width * 0.01,
          ),
          ElevatedButton(
            onPressed: () {
              // Add your logic to determine the mealType based on val1
              String mealType = '';
              if (val1 == 0) {
                mealType = 'breakfast';
              } else if (val1 == 1) {
                mealType = 'lunch';
              } else if (val1 == 2) {
                mealType = 'snacks';
              } else if (val1 == 3) {
                mealType = 'dinner';
              }

              if (mealType.isNotEmpty) {
                saveFoodToFirebase(mealType);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
