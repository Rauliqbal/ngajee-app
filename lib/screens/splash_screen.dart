import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ngajee',
              style: TextStyle(color: primary, fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
