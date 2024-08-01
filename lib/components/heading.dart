import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontFamily: "ProductSans",
              // fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  // offset: Offset(0, 2),
                  blurRadius: 2.0,
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
