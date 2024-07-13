import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.start
              : TextAlign.center;
      var axisAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center;
      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 50
              : 80;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 16
              : 21;

      return SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: axisAlignment,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WHO WE ARE',
              style: TextStyle(
                  fontWeight: FontWeight.w800, height: 0.9, fontSize: titleSize),
              textAlign: textAlignment,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
              style: TextStyle(fontSize: descriptionSize, height: 1.7),
              textAlign: textAlignment,
            ),
          ],
        ),
      );
    });
  }
}
