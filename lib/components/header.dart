import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:code_charm/components/logo.dart';
import 'package:code_charm/components/nav_bar.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:code_charm/screens/auth_screen.dart';

class Header extends StatefulWidget {
  final Function(GlobalKey) scrollToSection;
  final String? userName;
  final Function(String?) onAuthSuccess;

  const Header({
    super.key,
    required this.scrollToSection,
    required this.userName,
    required this.onAuthSuccess,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _clientKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();
  final GlobalKey _teamKey = GlobalKey();

  void _openAuthDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: const Color.fromARGB(255, 0, 62, 41),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: 400,
            child: AuthScreen(
              onAuthSuccess: (userName) {
                widget.onAuthSuccess(userName);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => widget.scrollToSection(_homeKey),
            child: const Logo(),
          ),
        ),
        const SizedBox(width: 175),
        Expanded(
          flex: 2,
          child: NavBar(
            onItemSelected: (index) {
              switch (index) {
                case 1:
                  widget.scrollToSection(_servicesKey);
                  break;
                case 2:
                  widget.scrollToSection(_contactKey);
                  break;
                case 3:
                  widget.scrollToSection(_clientKey);
                  break;
                case 4:
                  widget.scrollToSection(_teamKey);
                  break;
                case 5:
                  widget.scrollToSection(_faqKey);
                  break;
              }
            },
            userName: widget.userName,
          ),
        ),
        const Spacer(),
        if (widget.userName == null)
          ElevatedButton(
            onPressed: () => _openAuthDialog(context),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(110, 50),
              foregroundColor: Colors.white,
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontFamily: "ProductSans", fontSize: 22),
            ),
          )
        else
          Text(
            'Hello, ${widget.userName}',
            style: const TextStyle(color: Colors.white),
          ),
        const SizedBox(width: 20),
      ],
    );
  }

  GlobalKey get homeKey => _homeKey;
  GlobalKey get servicesKey => _servicesKey;
  GlobalKey get contactKey => _contactKey;
  GlobalKey get clientKey => _clientKey;
  GlobalKey get faqKey => _faqKey;
  GlobalKey get teamKey => _teamKey;
}
