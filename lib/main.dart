import 'dart:io';

import 'package:dietrecall/Screens/NavBarContent/Diet/mainDiet.dart';
import 'package:dietrecall/Screens/NavBarContent/Diet/mondayDiet.dart';
import 'package:dietrecall/Screens/NavBarContent/Diet/thursday.dart';
import 'package:dietrecall/Screens/NavBarContent/Diet/wednesdayDiet.dart';
import 'package:dietrecall/Screens/NavBarContent/getReport.dart';
import 'package:dietrecall/Screens/NavBarContent/preference.dart';
import 'package:dietrecall/Screens/NavBarContent/recaller.dart';
import 'package:dietrecall/Screens/NavBarContent/warning/warning.dart';
import 'package:dietrecall/Screens/NutritionValue.dart';
import 'package:dietrecall/Service/notifi_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/google_sign_in.dart';
import 'Screens/Homepage.dart';
import 'Screens/IntroPage.dart';
import 'Screens/NavBarContent/Diet/friday.dart';
import 'Screens/NavBarContent/Diet/saturday.dart';
import 'Screens/NavBarContent/Diet/sunday.dart';
import 'Screens/NavBarContent/Diet/tuesdayDiet.dart';
import 'Screens/Register.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await Firebase.initializeApp();

  // Register callbackDispatcher() as a periodic task
  // Workmanager().registerPeriodicTask("notifi1", "backup", frequency: const Duration(seconds: 2));

  runApp(const MainRoute());
}

class MainRoute extends StatefulWidget {
  const MainRoute({super.key});

  @override
  State<MainRoute> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: Platform.isAndroid
          ? MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const SplashScreen(),
                '/introscreen': (context) => const IntroPage(),
                '/login': (context) => const LoginPage(),
                '/register': (context) => const Register(),
                '/homepage': (context) => const HomePage(),
                '/report': (context) => const ReportPage(),
                '/recaller': (context) => const Recaller(),
                '/nutrition': (context) => NutritionValue(),
                '/preference': (context) => const FoodPreference(),
                '/weeklydiet': (context) => const WeeklyDiet(),
                '/maindiet': (context) => const MainDiet(),
                '/tuesdaydiet': (context) => const TuesdayDiet(),
                '/wednesdaydiet': (context) => const WednesdayDiet(),
                '/thursdaydiet': (context) => const ThursdayDiet(),
                '/fridaydiet': (context) => const FridayDiet(),
                '/saturdaydiet': (context) => const SaturdayDiet(),
                '/sundaydiet': (context) => const SundayDiet(),
                '/mainwarn': (context) => const Warning(),
                /*'/mondaywarn': (context) => const FoodWarn(),*/
              },
              title: 'DietRecall',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 252, 143, 128),
                  brightness: Brightness.dark,
                  surface: Colors.white,
                ),
              ),
            )
          : CupertinoApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const SplashScreen(),
                '/introscreen': (context) => const IntroPage(),
                '/login': (context) => const LoginPage(),
                '/register': (context) => const Register(),
                '/homepage': (context) => const HomePage(),
                '/report': (context) => const ReportPage(),
                '/recaller': (context) => const Recaller(),
                '/nutrition': (context) => NutritionValue(),
                '/preference': (context) => const FoodPreference(),
                '/weeklydiet': (context) => const WeeklyDiet(),
                '/maindiet': (context) => const MainDiet(),
                '/tuesdaydiet': (context) => const TuesdayDiet(),
                '/wednesdaydiet': (context) => const WednesdayDiet(),
                '/thursdaydiet': (context) => const ThursdayDiet(),
                '/fridaydiet': (context) => const FridayDiet(),
                '/saturdaydiet': (context) => const SaturdayDiet(),
                '/sundaydiet': (context) => const SundayDiet(),
                '/mainwarn': (context) => const Warning(),
                // '/mondaywarn': (context) => const FoodWarn(),
              },
              title: 'DietRecall',
              debugShowCheckedModeBanner: false,
            ),
    );
  }
}
