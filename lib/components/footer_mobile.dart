import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16), // Adjusted padding for mobile
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center align for mobile
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Expanded(
                child: Text(
                  '© 2021 CodeCharm. All rights reserved.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14, // Smaller font size for mobile
                  ),
                    textAlign: TextAlign.start, // Center align text for mobile
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min, // Adjust to avoid overflow
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                    onPressed: () => _launchUrl('https://in.linkedin.com/company/code-charm'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15), // Added spacing between rows
          const Text(
            "Your Vision, Our Code: Transforming Ideas into Reality",
            style: TextStyle(
              fontSize: 18, // Slightly smaller font size for mobile
              fontFamily: "ProductSans",
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 2.0,
                  color: primaryColor,
                ),
              ],
            ),
            textAlign: TextAlign.center, // Center align text for mobile
          ),
          const SizedBox(height: 10),
          const Text(
            'Built with Flutter Web',
            style: TextStyle(
              color: Color.fromARGB(213, 255, 255, 255),
              fontSize: 12, // Smaller font size for mobile
              fontFamily: "ProductSans",
            ),
            textAlign: TextAlign.center, // Center align text for mobile
          ),
        ],
      ),
    );
  }
}
