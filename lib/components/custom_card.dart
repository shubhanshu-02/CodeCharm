import 'package:flutter/material.dart';
// import 'package:code_charm/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String? buttonText;
  final bool? isMobile;
  

  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.isMobile,
  });

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
      constraints: const BoxConstraints(maxHeight: 300,maxWidth: 300),
      // height: 353,
      // width: 353,
      margin: isMobile == true ? const EdgeInsets.all(24.0) : const EdgeInsets.all(8), // Margin to ensure shadow visibility
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 62, 41),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 86, 181, 75),
            spreadRadius: 1,
            blurRadius: 20,
            // offset: Offset(0, 2), // Shadow slightly below the card
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontFamily: "ProductSans",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "ProductSans",
                      color: Color.fromARGB(200, 255, 255, 255),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // if (buttonText != null && url != null) ...[
                  //   const SizedBox(height: 20),
                  //   ElevatedButton(
                  //     onPressed: () => _launchUrl(url!),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: primaryColor,
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 28, vertical: 14),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(6),
                  //       ),
                  //     ),
                  //     child: Text(
                  //       buttonText!,
                  //       style: const TextStyle(
                  //         fontSize: 18,
                  //         fontFamily: "ProductSans",
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
