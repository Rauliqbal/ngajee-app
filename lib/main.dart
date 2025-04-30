import 'package:flutter/material.dart';
import 'package:ngajee_app/screens/home_screen.dart';
import 'package:ngajee_app/screens/splash_screen.dart';
import 'package:ngajee_app/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: primary)),
      routes: {'/home': (context) => HomeScreen()},
      home: SplashScreen(),
    );
  }
}
