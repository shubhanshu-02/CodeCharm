import 'package:flutter/material.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String? buttonText;
  final String? url;

  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.url,
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
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: primaryColor,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style:const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(187, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                if (buttonText != null && url != null) ...[
                   const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _launchUrl(url!),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding:const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      buttonText!,
                      style:const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
