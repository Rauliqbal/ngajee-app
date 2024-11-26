import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajee_app/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.of(context)
  //         .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
  //   });
  // }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ngajee.png',
              width: 220,
            ),
            const Text(
              'Ngajee',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
