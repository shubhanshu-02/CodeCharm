import 'dart:ui';

import 'package:code_charm/components/footer_mobile.dart';
import 'package:code_charm/components/navDrawer/nav_drawer.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:code_charm/screens/HomeScreen/home_screen_mobile.dart';
import 'package:code_charm/screens/auth_screen.dart';
import 'package:code_charm/screens/clients_screen.dart';
import 'package:code_charm/screens/contactScreen/contact_screen.dart';
import 'package:code_charm/screens/faq_screen.dart';
import 'package:code_charm/screens/services_screen.dart';
import 'package:code_charm/screens/team_screen.dart';
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
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SizedBox(
            height: 100,
            width: 200,
            child: Image.asset("assets/logo_text.png"),
          ),
        ),
        actions: [
          _userName == null
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => _openAuthDialog(context),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(80, 35),
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 5,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontFamily: "ProductSans", fontSize: 16),
                    ),
                    // SizedBox(width: 20,),
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
            ContactScreen(key: _contactKey),
            ClientsScreen(key: _clientKey),
            TeamScreen(key: _teamKey),
            Padding(
              padding: const EdgeInsets.all(12),
              child: FAQScreen(key: _faqKey),
            ),
            const SizedBox(height: 30,),
            const FooterMobile(),
          ],
        ),
      ),
    );
  }
}
