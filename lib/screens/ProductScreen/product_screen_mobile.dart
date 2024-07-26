import 'package:code_charm/components/Paragraph.dart';
import 'package:flutter/material.dart';

class ProductScreenMobile extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDetail;
  final String googlePlayLink;
  final String figmaLink;
  final Future<void> Function(String url) launchUrl;

  const ProductScreenMobile({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productDetail,
    required this.googlePlayLink,
    required this.figmaLink,
    required this.launchUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Image.asset(productImage, fit: BoxFit.cover),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Paragraph(
                heading: productName,
                details: productDetail,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => launchUrl(googlePlayLink),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text("Google Play link"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => launchUrl(figmaLink),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text("Figma Play link"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
