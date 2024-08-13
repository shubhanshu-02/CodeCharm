import 'package:code_charm/components/Paragraph.dart';
import 'package:flutter/material.dart';

class ProductScreenDesktop extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDetail;
  final String googlePlayLink;
  final String figmaLink;
  final Future<void> Function(String url) launchUrl;

  const ProductScreenDesktop({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // border: Border.all(color: Colors.black),
                  boxShadow: const [
                    BoxShadow(
                      color:  Color.fromARGB(255, 0, 0, 0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                  //   BoxShadow(
                  //     color: Colors.white,
                  //     offset: const Offset(0.0, 0.0),
                  //     blurRadius: 0.0,
                  //     spreadRadius: 0.0,
                  //   ), //BoxShadow
                  ],
          ),
          child: ClipRRect(borderRadius: BorderRadius.circular(6),child: Image.asset(productImage, fit: BoxFit.cover)),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              Paragraph(
                heading: productName,
                details: productDetail,
              ),
              const SizedBox(height: 30),
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
