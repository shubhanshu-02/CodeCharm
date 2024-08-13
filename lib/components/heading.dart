import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
        Color textColor = bgColor == const Color.fromARGB(255, 255, 255, 255) ? primaryColor : Colors.white;

    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontFamily: "ProductSans",
              // fontWeight: FontWeight.bold,
              color: textColor,
              shadows: const [
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
