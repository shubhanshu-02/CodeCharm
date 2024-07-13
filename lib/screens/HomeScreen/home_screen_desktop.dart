import 'package:code_charm/components/Paragraph.dart';
import 'package:code_charm/components/my_button.dart';
import 'package:code_charm/screens/services_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children:  [
        Paragraph(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore our',
                  style: TextStyle(
                  fontWeight: FontWeight.w400, height: 0.9, fontSize: 50),
                ),
                SizedBox(height: 30), // Adds space between the text and button
                MyButton(title: 'Services',targetScreen: ServicesScreen(),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
