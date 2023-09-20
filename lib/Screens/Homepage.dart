import 'package:dietrecall/Screens/NavBarContent/Camera.dart';
import 'package:dietrecall/Screens/NavBarContent/house.dart';
import 'package:dietrecall/Screens/NavBarContent/questions.dart';
import 'package:dietrecall/Screens/NavBarContent/search.dart';
import 'package:dietrecall/Screens/NavBarContent/userscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //screen index
  var _bottomNavIndex = 0;
  //icon list
  final iconList = [
    Icons.home,
    Icons.search_outlined,
    Icons.camera,
    Icons.edit_note_sharp,
    Icons.account_circle_rounded,
  ];
  //screens
  final screens = [
    const House(),
    const Search(),
    const Camera(),
    const Questions(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //screen height and width
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (Platform.isAndroid) {
      return _buildMaterialHomePage(height, width);
    } else if (Platform.isIOS) {
      return _buildCupertinoHomePage(height, width);
    } else {
      // Handle other platforms if necessary
      return const Center(
        child: Text("Unsupported platform"),
      );
    }
  }

  Widget _buildMaterialHomePage(double height, double width) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _bottomNavIndex,
        children: screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(
              255, 145, 199, 136), // Set bottom navigation bar color here
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Prevents zooming effect
          backgroundColor: const Color.fromARGB(255, 145, 199, 136),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          currentIndex: _bottomNavIndex,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          items: iconList.map((icon) {
            return BottomNavigationBarItem(
              icon: Icon(icon, size: height * 0.03 + width * 0.03),
              label: '',
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCupertinoHomePage(double height, double width) {
    return CupertinoPageScaffold(
      child: Column(
        children: <Widget>[
          Expanded(
            child: IndexedStack(
              index: _bottomNavIndex,
              children: screens,
            ),
          ),
          SizedBox(
            height: height * 0.09 + width * 0.03,
            child: CupertinoTabBar(
              backgroundColor: const Color.fromARGB(255, 145, 199, 136),
              activeColor: CupertinoColors.white,
              items: iconList.map((icon) {
                return BottomNavigationBarItem(
                  icon: Icon(
                    icon,
                    color:
                        _bottomNavIndex == 2 ? Colors.white : Colors.grey[300],
                    size:
                        height * 0.035 + width * 0.025, // Adjust the icon size
                  ),
                  label: '',
                );
              }).toList(),
              currentIndex: _bottomNavIndex,
              onTap: (index) {
                setState(() {
                  _bottomNavIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
