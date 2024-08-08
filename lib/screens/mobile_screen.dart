// file: lib/screens/mobile_screen.dart
// import 'package:code_charm/components/logo.dart';
import 'dart:ui';

import 'package:code_charm/components/navDrawer/nav_drawer.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:code_charm/screens/HomeScreen/home_screen_mobile.dart';
import 'package:code_charm/screens/auth_screen.dart';
import 'package:code_charm/screens/faq_screen.dart';
import 'package:code_charm/screens/services_screen.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _clientKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();
  final GlobalKey _teamKey = GlobalKey();
  String? _userName;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void _openAuthDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: const Color.fromARGB(255, 0, 62, 41),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: 400,
            child: AuthScreen(
              onAuthSuccess: (userName) {
                setState(() {
                  _userName = userName;
                });
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
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavDrawer(
        onItemSelected: (index) {
          switch (index) {
            case 1:
              _scrollToSection(_homeKey);
              break;
            case 2:
              _scrollToSection(_servicesKey);
              break;
            case 3:
              _scrollToSection(_contactKey);
              break;
            case 4:
              _scrollToSection(_clientKey);
              break;
            case 5:
              _scrollToSection(_faqKey);
              break;
            case 6:
              _scrollToSection(_teamKey);
              break;
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: navColor,
        centerTitle: true,
        title: SizedBox(
          height: 100,
          width: 200,
          child: Image.asset("assets/logo.png"),
        ),
        actions: [
          _userName == null
              ? ElevatedButton(
                  onPressed: () => _openAuthDialog(context),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 35),
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    // textAlign: Ali
                    'Login',
                    style: TextStyle(fontFamily: "ProductSans", fontSize: 12),
                  ),
                )
              : Text(
                  'Hello, $_userName',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "ProductSans",
                    fontSize: 18,
                  ),
                ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeScreenMobile(
              key : _homeKey,
              onServicesPressed: () => _scrollToSection(_servicesKey),
            ),
            ServicesScreen(key: _servicesKey),
            FAQScreen(key: _faqKey),
          ],
        ),
      ),
    );
  }
}
