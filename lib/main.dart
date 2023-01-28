import 'package:flutter/material.dart';

import 'globals/app_colors.dart';
import 'package:tamuhack/screens/rideshare/give_a_ride/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TAMUHack 2023',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            //primarySwatch: Colors.,
            ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // Starts on the Login Screen
        initialRoute: "/GiveRide",
        // List of routes for our User to use
        routes: {
          // Login Route for the User
          //"/": (context) => const LoginPage(),
          "/GiveRide": (context) => const GiveRide(),
          //"/Main": (context) => const MainPage(),
        });
  }
}
