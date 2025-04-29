import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_mushaf/screens/get_started.dart';
import 'package:my_mushaf/screens/home_screen.dart';
import 'package:my_mushaf/screens/quran_list.dart';
import 'package:my_mushaf/styles/colors.dart';

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
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          useMaterial3: true,
        ),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/quran': (context) => const QuranList()
        },
        home: const GetStarted());
  }
}
