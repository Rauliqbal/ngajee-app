import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_mushaf/widget/page_widget.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return Scaffold(
      body: PageWidget(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 186,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: const Text(
                      'My Mushaf',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ))),
    );
  }
}
