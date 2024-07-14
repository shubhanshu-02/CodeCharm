import 'package:code_charm/components/Paragraph.dart';
import 'package:code_charm/components/my_button.dart';
import 'package:code_charm/screens/services_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Paragraph(heading: "who we are", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ",),  
        SizedBox(height: 100,),
        MyButton(title: 'Explore our Services',targetScreen: ServicesScreen()),
      ],
    );

  }
}