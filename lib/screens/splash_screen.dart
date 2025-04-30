import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajee_app/widget/page_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00B5AA), Color(0xFF297C77)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(child: Image.asset('assets/images/masjid.png')),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/logo.svg',
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Ngajee',
                          style: GoogleFonts.rakkas(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
