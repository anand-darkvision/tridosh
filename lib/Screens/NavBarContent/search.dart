import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class FoodItem {
  final String name;
  final String servingQty;
  final String itemId;
  final double calories;
  final double totalFat;
  final String thumbnailUrl;

  FoodItem({
    required this.name,
    required this.servingQty,
    required this.itemId,
    required this.calories,
    required this.totalFat,
    required this.thumbnailUrl,
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

        final List<FoodItem> foodItems = commonFoods.map((food) {
          return FoodItem(
            name: food['food_name'],
            servingQty: food['serving_unit'],
            itemId: food['tag_id'].toString(),
            calories: food['full_nutrients']
                .firstWhere((nutrient) => nutrient['attr_id'] == 208)['value']
                .toDouble(),
            totalFat: food['full_nutrients']
                .firstWhere((nutrient) => nutrient['attr_id'] == 204)['value']
                .toDouble(),
            thumbnailUrl: food['photo']['thumb'],
          );
        }).toList();

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

  Widget buildSearchInput(BuildContext context) {
    return Platform.isAndroid
        ? TextFormField(
            minLines: null,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0, // Use a specific font size
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
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 2.0,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.search,
                  color: Colors.black,
                  size: 18.0, // Use a specific icon size
                ),
                onPressed: () {
                  final query = _searchController.text;
                  searchFood(query);
                },
              ),
            ),
          )
        : CupertinoTextField(
            keyboardType: TextInputType.text,
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            controller: _searchController,
            placeholder: 'Search',
            placeholderStyle: const TextStyle(
              color: Colors.grey,
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0, // Use a specific font size
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black),
            ),
            suffix: CupertinoButton(
              child: const Icon(
                FontAwesomeIcons.search,
                color: Colors.black,
                size: 18.0, // Use a specific icon size
              ),
              onPressed: () {
                final query = _searchController.text;
                searchFood(query);
              },
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.02 + width * 0.02, // Adjust height as needed
            ),
            SizedBox(
              height: height * 0.04 + width * 0.04, // Adjust height as needed
              width: height * 0.2 + width * 0.15, // Adjust width as needed
              child: buildSearchInput(context),
            ),
            const SizedBox(
              height: 30.0, // Adjust height as needed
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final foodItem = _foodItems[index];
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: Card(
                      color: const Color.fromARGB(255, 177, 222, 169),
                      elevation: 2.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: ListTile(
                        title: Text(
                          foodItem.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            Text(
                              'Brand: ${foodItem.servingQty}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Calories: ${foodItem.calories}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Total Fat: ${foodItem.totalFat}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: "Comfortaa",
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                        leading: Image.network(
                          foodItem.thumbnailUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
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
  }
}
