import 'package:code_charm/components/Paragraph.dart';
import 'package:code_charm/components/linkedin_button.dart';
// import 'package:code_charm/components/chat_bot_widget.dart';
import 'package:code_charm/components/my_button.dart';
import 'package:code_charm/screens/services_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.only(left: 60.0),
      child: const Row(
        children: [
          Paragraph(
            heading: "WHO WE ARE",
            details:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ",
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore our',
                    style: TextStyle(
                      color: Color.fromARGB(255, 231, 231, 231),
                        fontFamily: "ProductSans",
                        fontWeight: FontWeight.w400,
                        height: 0.9,
                        fontSize: 50),
                  ),
                  SizedBox(height: 30), // Adds space between the text and button
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyButton(
                        title: 'Services',
                        targetScreen: ServicesScreen(),
                      ),
                      SizedBox(width: 20), // Space between buttons
                      LinkedinButton(),
                    ],
                  ),
                
                ],
              ),
            ),
          ),
        ],
        
      ),
    );
  }
}
 