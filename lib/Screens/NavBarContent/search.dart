import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class FoodItem {
  final String name;
  final String brandName;
  final String itemId;
  final double calories;
  final double totalFat;

  FoodItem({
    required this.name,
    required this.brandName,
    required this.itemId,
    required this.calories,
    required this.totalFat,
  });
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<FoodItem> _foodItems = [];

  Future<void> searchFood(String query) async {
    final String url =
        'https://trackapi.nutritionix.com/v2/search/$query?results=0:50&fields=item_name,brand_name,item_id,nf_calories,nf_total_fat,images_front_full_url&appId=e975eb9b&appKey=3a38f2a27a0d580081ca6b91a4ed7847';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> hits = data['hits'];
        final List<FoodItem> foodItems = [];

        for (final hit in hits) {
          final String name = hit['fields']['item_name'];
          final String brandName = hit['fields']['brand_name'];
          final String itemId = hit['fields']['item_id'];
          final double calories =
              double.parse(hit['fields']['nf_calories'].toString());
          final double totalFat =
              double.parse(hit['fields']['nf_total_fat'].toString());

          final FoodItem foodItem = FoodItem(
            name: name,
            brandName: brandName,
            itemId: itemId,
            calories: calories,
            totalFat: totalFat,
          );
          foodItems.add(foodItem);
        }

        setState(() {
          _foodItems = foodItems;
        });
      } else {
        // Handle non-200 response status codes here
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget content;

    if (Platform.isAndroid) {
      content = Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.1 + width * 0.03,
            ),
            SizedBox(
              height: height * 0.07 + width * 0.01,
              width: width * 0.3 + height * 0.25,
              child: TextFormField(
                minLines: null,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.018 + width * 0.018,
                ),
                controller: _searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: height * 0.008 + width * 0.008,
                    horizontal: height * 0.008 + width * 0.008,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.black,
                      size: height * 0.018 + width * 0.018,
                    ),
                    onPressed: () {
                      final query = _searchController.text;
                      searchFood(query);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03 + width * 0.03,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final foodItem = _foodItems[index];
                  return Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(
                      vertical: height * 0.01 + width * 0.01,
                      horizontal: width * 0.04 + height * 0.04,
                    ),
                    child: ListTile(
                      title: Text(
                        foodItem.name,
                        style: TextStyle(
                          fontSize: height * 0.018 + width * 0.018,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.01 + width * 0.01),
                          Text(
                            'Brand: ${foodItem.brandName}',
                            style: TextStyle(
                              fontSize: height * 0.015 + width * 0.015,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                          SizedBox(height: height * 0.01 + width * 0.01),
                          Text(
                            'Calories: ${foodItem.calories}',
                            style: TextStyle(
                              fontSize: height * 0.015 + width * 0.015,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                          SizedBox(height: height * 0.01 + width * 0.01),
                          Text(
                            'Total Fat: ${foodItem.totalFat}',
                            style: TextStyle(
                              fontSize: height * 0.015 + width * 0.015,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                          SizedBox(height: height * 0.01 + width * 0.01),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else if (Platform.isIOS) {
      content = CupertinoPageScaffold(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: height * 0.01 * width * 0.007),
              SizedBox(
                height: height * 0.07 + width * 0.01,
                width: width * 0.3 + height * 0.25,
                child: CupertinoTextField(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.008 + width * 0.008,
                    horizontal: height * 0.008 + width * 0.008,
                  ),
                  controller: _searchController,
                  placeholder: 'Search',
                  placeholderStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.018 + width * 0.018,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black),
                  ),
                  suffix: CupertinoButton(
                    child: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.black,
                      size: height * 0.018 + width * 0.018,
                    ),
                    onPressed: () {
                      final query = _searchController.text;
                      searchFood(query);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03 + width * 0.03,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _foodItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final foodItem = _foodItems[index];
                    return Card(
                      elevation: 2.0,
                      margin: EdgeInsets.symmetric(
                        vertical: height * 0.01 + width * 0.01,
                        horizontal: width * 0.04 + height * 0.04,
                      ),
                      child: ListTile(
                        title: Text(
                          foodItem.name,
                          style: TextStyle(
                            fontSize: height * 0.018 + width * 0.018,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.01 + width * 0.01),
                            Text(
                              'Brand: ${foodItem.brandName}',
                              style: TextStyle(
                                fontSize: height * 0.015 + width * 0.015,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                            SizedBox(height: height * 0.01 + width * 0.01),
                            Text(
                              'Calories: ${foodItem.calories}',
                              style: TextStyle(
                                fontSize: height * 0.015 + width * 0.015,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                            SizedBox(height: height * 0.01 + width * 0.01),
                            Text(
                              'Total Fat: ${foodItem.totalFat}',
                              style: TextStyle(
                                fontSize: height * 0.015 + width * 0.015,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                            SizedBox(height: height * 0.01 + width * 0.01),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // Handle other platforms
      content = const Center(
        child: Text('Unsupported platform'),
      );
    }

    return content;
  }
}