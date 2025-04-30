import 'dart:ui';

import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  const PageWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: -50,
            top: -40,
            child: _bluredCircle(color: 0xFF00ADB5),
          ),
          Positioned(
            left: -60,
            bottom: -50,
            child: _bluredCircle(color: 0xFF00ADB5),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }

  Container _bluredCircle({required int color}) {
    return Container(
      width: 161,
      height: 161,
      decoration: BoxDecoration(
        color: Color(color).withOpacity(.1),
        borderRadius: BorderRadius.circular(161),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(),
      ),
    );
  }
}
