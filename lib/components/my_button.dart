import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Widget? targetScreen;
  final VoidCallback? onPressed;

  const MyButton({super.key, required this.title, this.targetScreen, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MyButtonMobile(title: title, targetScreen: targetScreen, onPressed: onPressed);
        } else {
          return MyButtonDesktop(title: title, targetScreen: targetScreen, onPressed: onPressed);
        }
      },
    );
  }
}

class MyButtonDesktop extends StatefulWidget {
  final String title;
  final Widget? targetScreen;
  final VoidCallback? onPressed;

  const MyButtonDesktop({super.key, required this.title, this.targetScreen, this.onPressed});

  @override
  _MyButtonDesktopState createState() => _MyButtonDesktopState();
}

class _MyButtonDesktopState extends State<MyButtonDesktop> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 200,
      child: GestureDetector(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          } else if (widget.targetScreen != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.targetScreen!),
            );
          }
        },
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: isHovered
                  ? const LinearGradient(colors: [Colors.blue, blue])
                  : const LinearGradient(colors: [Color.fromRGBO(70, 133, 133, 1), Color.fromARGB(255, 80, 180, 152)]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
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
        ),
      ),
    );
  }
}

class MyButtonMobile extends StatelessWidget {
  final String title;
  final Widget? targetScreen;
  final VoidCallback? onPressed;

  const MyButtonMobile({super.key, required this.title, this.targetScreen, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else if (targetScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen!),
          );
        }
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
