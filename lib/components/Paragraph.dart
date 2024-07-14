import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Paragraph extends StatelessWidget {
  final String heading;
  final String details;

  const Paragraph({super.key,required this.heading, required this.details});

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
              heading,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  height: 0.9,
                  fontSize: titleSize),
              textAlign: textAlignment,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              details,
              style: TextStyle(fontSize: descriptionSize, height: 1.7),
              textAlign: textAlignment,
            ),
          ],
        ),
      );
    });
  }
}
