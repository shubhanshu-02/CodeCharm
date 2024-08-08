import 'package:code_charm/components/Paragraph.dart';
import 'package:code_charm/components/linkedin_button.dart';
import 'package:code_charm/components/my_button.dart';
import 'package:code_charm/components/new_linkedin_button.dart';
import 'package:flutter/material.dart';

class HomeScreenMobile extends StatelessWidget {
  final VoidCallback onServicesPressed;

  const HomeScreenMobile({super.key, required this.onServicesPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 130),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Paragraph(
            heading: "WHO ARE WE",
            details: "We are a Development firm who brings your imagination to reality. We develop websites and Mobile applications that scale to 3-4k+ users. Wanna discuss your idea? Reach us out...",
          ),  
          const SizedBox(height: 30),
          MyButton(
            title: 'Explore our Services',
            onPressed: onServicesPressed,
          ),
          const SizedBox(height: 20,),
          const NewLinkedinButton(),
        ],
      ),
    );
  }
}
