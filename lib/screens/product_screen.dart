import 'package:code_charm/components/Paragraph.dart';
import 'package:code_charm/constants/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDetail;
  final String googlePlayLink;
  final String figmaLink;

  const ProductScreen({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productDetail,
    required this.googlePlayLink,
    required this.figmaLink,
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
    return Padding(
      padding: const EdgeInsets.only(top:10, bottom: 20.0, left: 10,right: 10),
      child: Scaffold(
        appBar: customAppBar(
          title: 'Product Page'),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              bool isDesktop =
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop;
      
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isDesktop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              height: 400,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Image.asset(productImage, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 20),
                            Paragraph(
                              heading: productName,
                              details: productDetail,
                            ),
                          ],
                        )
                      : Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Image.asset(productImage, fit: BoxFit.cover),
                              ),
                              SizedBox(height: 20),
                              Paragraph(
                                heading: productName,
                                details: productDetail,
                              ),
                            ],
                          ),
                      ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _launchUrl(googlePlayLink),
                        child: Text("Google Play link"),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () => _launchUrl(figmaLink),
                        child: Text("Figma Play link"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
