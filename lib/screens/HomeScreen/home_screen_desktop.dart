import 'package:code_charm/components/Paragraph.dart';
import 'package:code_charm/components/my_button.dart';
import 'package:code_charm/screens/services_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(left: 60.0),
      child: Row(
        children:  [
          Paragraph(heading: "WHO WE ARE", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ",),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore our',
                    style: TextStyle(fontFamily: "ProductSans",
                    fontWeight: FontWeight.w400, height: 0.9, fontSize: 50),
                  ),
                  SizedBox(height: 30), // Adds space between the text and button
                  MyButton(title: 'Services',targetScreen: ServicesScreen(),),
                ],
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
