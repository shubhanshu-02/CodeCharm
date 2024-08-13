import 'package:code_charm/components/heading.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class TeamScreenMobile extends StatelessWidget {
  const TeamScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      margin: const EdgeInsets.all(8),
      child: const Column(
        children: [
          Heading(title: "Team Members"),
          TeamCard(image: 'assets/dhruv.png',title: 'Dhruv',subtitle: 'Chief Executive Head'),
          SizedBox(height: 25,),
          TeamCard(image: "shubh.png", title: "Shubhanshu", subtitle: "Web/App Developer", isImageLeft: false,),
          SizedBox(height: 25,),
          TeamCard(image: 'assets/lakshya.png',title: 'Lakshya',subtitle: 'Backend Developer'),
        ],
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool isImageLeft;

  const TeamCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.isImageLeft = true, // Default to true for image on the left
  });

  @override
  Widget build(BuildContext context) {
    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        image,
        width: 200,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );

    final textWidget = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontFamily: "ProductSans",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: "ProductSans",
              color: Color.fromARGB(148, 0, 0, 0),
            ),
          ),
        ],
      ),
    );

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 200,
        maxWidth: 450,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: green,
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: isImageLeft
            ? [imageWidget, const SizedBox(width: 30), textWidget]
            : [const SizedBox(width: 30),textWidget, imageWidget],
      ),
    );
  }
}
