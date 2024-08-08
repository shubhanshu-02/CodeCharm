import 'dart:ui';
import 'package:code_charm/components/footer.dart';
import 'package:code_charm/components/logo.dart';
import 'package:code_charm/components/nav_bar.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:code_charm/screens/HomeScreen/home_screen_desktop.dart';
import 'package:code_charm/screens/auth_screen.dart';
import 'package:code_charm/screens/clients_screen.dart';
import 'package:code_charm/screens/contact_screen.dart';
import 'package:code_charm/screens/faq_screen.dart';
import 'package:code_charm/screens/services_screen.dart';
import 'package:code_charm/screens/team_screen.dart';
import 'package:flutter/material.dart';
import 'package:code_charm/components/centered_view.dart';
import 'package:code_charm/components/chat_bot_widget.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  _DesktopScreenState createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
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
      // drawer:NavDrawer(),
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _scrollToSection(_homeKey),
                        child: const Logo(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: NavBar(
                      onItemSelected: (index) {
                        switch (index) {
                          case 1:
                            _scrollToSection(_servicesKey);
                            break;
                          case 2:
                            _scrollToSection(_contactKey);
                            break;
                          case 3:
                            _scrollToSection(_clientKey);
                            break;
                          case 4:
                            _scrollToSection(_teamKey);
                            break;
                          case 5:
                            _scrollToSection(_faqKey);
                            break;
                        }
                      },
                      userName: _userName,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  // const SizedBox(widthr: 400,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _userName == null 
                        ? ElevatedButton(
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
                              style: TextStyle(
                                  fontFamily: "ProductSans", fontSize: 22),
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
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CenteredView(
                        key: _homeKey,
                        child: HomeScreen(
                          onServicesPressed: () =>
                              _scrollToSection(_servicesKey),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ServicesScreen(key: _servicesKey),
                      CenteredView(child: ContactScreen(key: _contactKey)),
                      CenteredView(child: ClientsScreen(key: _clientKey)),
                      TeamScreen(key: _teamKey),
                      CenteredView(child: FAQScreen(key: _faqKey)),
                      const SizedBox(height: 40,),
                      const Footer()
                    ],
                  ),
                ),
              ),
            ],
          ),
          const ChatBotWidget(),
        ],
      ),
    );
  }
}
