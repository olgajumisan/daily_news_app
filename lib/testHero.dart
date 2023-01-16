import 'package:flutter/material.dart';

class TestHero extends StatelessWidget {
  final double width;
  final double height;
  final String path;
  final double radius;

  TestHero({
    required this.width,
    required this.height,
    required this.path,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Hero(
          tag: path,
          child: Image.asset(
            path,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
