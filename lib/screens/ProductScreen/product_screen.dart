import 'package:code_charm/constants/colors.dart';
import 'package:code_charm/screens/ProductScreen/product_screen_desktop.dart';
import 'package:code_charm/screens/ProductScreen/product_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:code_charm/components/custom_appbar.dart';
import 'package:code_charm/components/centered_view.dart';
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
    return Scaffold(
      backgroundColor: bgColor,
      appBar: customAppBar(title: 'Product Page'),
      body: CenteredView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return ProductScreenDesktop(
                  productImage: productImage,
                  productName: productName,
                  productDetail: productDetail,
                  googlePlayLink: googlePlayLink,
                  figmaLink: figmaLink,
                  launchUrl: _launchUrl,
                );
              } else {
                return ProductScreenMobile(
                  productImage: productImage,
                  productName: productName,
                  productDetail: productDetail,
                  googlePlayLink: googlePlayLink,
                  figmaLink: figmaLink,
                  launchUrl: _launchUrl,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
