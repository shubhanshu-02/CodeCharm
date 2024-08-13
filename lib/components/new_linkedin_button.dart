import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class NewLinkedinButton extends StatelessWidget {
  const NewLinkedinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile) {
          return const LinkedinButtonMobile();
        } else {
          return const LinkedinButtonDesktop();
        }
      },
    );
  }
}

// Desktop version of LinkedInButton
class LinkedinButtonDesktop extends StatefulWidget {
  const LinkedinButtonDesktop({super.key});

  @override
  _LinkedinButtonDesktopState createState() => _LinkedinButtonDesktopState();
}

class _LinkedinButtonDesktopState extends State<LinkedinButtonDesktop> {
  bool isHovered = false;

  void _launchURL() async {
    const url = 'https://in.linkedin.com/company/code-charm';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 200,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: _launchURL,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: isHovered
                  ? const LinearGradient(colors: [
                      Color.fromRGBO(70, 133, 133, 1),
                      Color.fromARGB(255, 80, 180, 152)
                    ])
                  : const LinearGradient(colors: [Colors.lightBlue, blue]),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/linkedin.png",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8),
                const Text(
                  'LinkedIn',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      fontFamily: "ProductSans"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Mobile version of LinkedInButton
class LinkedinButtonMobile extends StatefulWidget {
  const LinkedinButtonMobile({super.key});

  @override
  _LinkedinButtonMobileState createState() => _LinkedinButtonMobileState();
}

class _LinkedinButtonMobileState extends State<LinkedinButtonMobile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(begin: 4.0, end: 8.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _launchURL() async {
    const url = 'https://in.linkedin.com/company/code-charm';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) {
        _animationController.reverse();
        _launchURL();
      },
      onTapCancel: () => _animationController.reverse(),
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: Material(
          elevation: _elevationAnimation.value,
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.lightBlue, Colors.blue],
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/linkedin.png",
                  height: 26,
                  width: 26,
                ),
                const SizedBox(width: 8),
                const Text(
                  'LinkedIn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: "ProductSans",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
