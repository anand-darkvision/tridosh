import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WeeklyDiet extends StatefulWidget {
  const WeeklyDiet({Key? key}) : super(key: key);

  @override
  State<WeeklyDiet> createState() => _WeeklyDietState();
}

class _WeeklyDietState extends State<WeeklyDiet> {
  @override
  Widget build(BuildContext context) {
    //screen size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.04 + width * 0.01,
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
                    width: width * 0.20 + height * 0.01,
                  ),
                  Text(
                    "Weekly Diet",
                    style: TextStyle(color: Colors.black, fontSize: height * 0.015 + width * 0.02, fontFamily: "Comfortaa"),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01 + width * 0.01,
              ),
            ],
          ),
          SizedBox(height: height * 0.07 + width * 0.01),
          CarouselSlider(
            items: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: 350,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage('Assets/image/Monday.gif'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your Diet For Monday",
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: 350,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage('Assets/image/Tuesday.gif'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your Diet For Tuesday",
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: 350,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage('Assets/image/Wednesday.gif'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your Diet For \n Wednesday",
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: 350,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage('Assets/image/Thursday.gif'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your Diet For Thursday",
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: 350,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage('Assets/image/Friday.gif'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your Diet For Friday",
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: 350,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage('Assets/image/Saturday.gif'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Your diet for saturday",
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: 350,
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage('Assets/image/Sunday.gif'),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "your diet for sunday",
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 360.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.75,
            ),
          ),
        ],
      ),
    );
  }
}
