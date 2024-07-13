import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Widget targetScreen;
  const MyButton({super.key, required this.title, required this.targetScreen});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MyButtonMobile(title: title, targetScreen: targetScreen);
        } else {
          return MyButtonDesktop(title: title, targetScreen: targetScreen);
        }
      },
    );
  }
}

class MyButtonDesktop extends StatefulWidget {
  final String title;
  final Widget targetScreen;
  const MyButtonDesktop({super.key, required this.title, required this.targetScreen});

  @override
  _MyButtonDesktopState createState() => _MyButtonDesktopState();
}

class _MyButtonDesktopState extends State<MyButtonDesktop> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.targetScreen),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
          decoration: BoxDecoration(
            gradient: isHovered
                ? const LinearGradient(colors: [Colors.blue, Colors.green])
                : const LinearGradient(colors: [const Color.fromRGBO(26, 35, 126, 1), const Color.fromRGBO(121, 134, 203, 1)]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MyButtonMobile extends StatelessWidget {
  final String title;
  final Widget targetScreen;
  const MyButtonMobile({super.key, required this.title, required this.targetScreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.white.withAlpha(30), // Ripple effect color
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
