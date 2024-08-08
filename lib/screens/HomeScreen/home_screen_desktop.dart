import 'package:code_charm/components/Paragraph.dart';
import 'package:code_charm/components/linkedin_button.dart';
import 'package:code_charm/components/my_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onServicesPressed;

  const HomeScreen({super.key, required this.onServicesPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.only(left: 60.0),
      child: Row(
        children: [
          const Paragraph(
            heading: "WHO ARE WE",
            details:
                "We are a Development firm who brings your imagination to reality. We develop websites and Mobile applications that scale to 3-4k+ users. Wanna discuss your idea ? Reach us out... ",
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Explore our',
                    style: TextStyle(
                      color: Color.fromARGB(255, 231, 231, 231),
                        fontFamily: "ProductSans",
                        fontWeight: FontWeight.w400,
                        height: 0.9,
                        fontSize: 50),
                  ),
                  const SizedBox(height: 30), // Adds space between the text and button
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyButton(
                        title: 'Services',
                        onPressed: onServicesPressed,
                      ),
                      const SizedBox(width: 20), 
                      const LinkedinButton(),
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
 