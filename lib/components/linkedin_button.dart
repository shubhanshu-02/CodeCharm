import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedinButton extends StatefulWidget {
  const LinkedinButton({super.key});

  @override
  _LinkedinButtonState createState() => _LinkedinButtonState();
}

class _LinkedinButtonState extends State<LinkedinButton> {
  bool isHovered = false;

  void _launchURL() async {
    const url = 'https://in.linkedin.com/company/code-charm';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 200,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: _launchURL,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: isHovered
                  ? const LinearGradient(colors: [
                      Color.fromRGBO(70, 133, 133, 1),
                      Color.fromARGB(255, 80, 180, 152)
                    ])
                  : const LinearGradient(colors: [Colors.lightBlue, blue]),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the Row content
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/linkedin.png",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8),
                const Text(
                  'LinkedIn',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      fontFamily: "ProductSans"), 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
