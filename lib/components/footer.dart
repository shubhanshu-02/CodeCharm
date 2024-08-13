import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '© 2021 CodeCharm. All rights reserved.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  // IconButton(
                  //   icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                  //   onPressed: () {
                  //     // Add your Facebook URL
                  //   },
                  // ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
                    onPressed: () {
                      // launchUrl("https://in.linkedin.com/company/code-charm")
                      // Add your LinkedIn URL
                    },
                    
  
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                    onPressed: () => _launchUrl('https://in.linkedin.com/company/code-charm'),
                  ),
                const SizedBox(width: 30,)
                ],
              ),
            ],
          ),
          // const SizedBox(height: 10),
          const Text(
            "Your Vision, Our Code: Transforming Ideas into Reality",
            style: TextStyle(
              fontSize: 22,
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
          const Text(
            'Built with Flutter Web',
            style: TextStyle(
              color: Color.fromARGB(213, 255, 255, 255),
              fontSize: 14,
              fontFamily: "ProductSans"
            ),
          ),
        ],
      ),
    );
  }
}
