import 'package:code_charm/components/centered_view.dart';
import 'package:code_charm/components/NavBar/nav_bar.dart';
import 'package:code_charm/components/chat_bot_widget.dart';
import 'package:code_charm/components/navDrawer/nav_drawer.dart';
import 'package:code_charm/screens/HomeScreen/home_screen_desktop.dart';
import 'package:code_charm/screens/HomeScreen/home_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      body: CenteredView(
          child: Stack(
        children: [
          Column(
            children: [
              const NavBar(),
              Expanded(
                child: ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
                      return const HomeScreenMobile();
                    } else {
                      return const HomeScreenDesktop();
                    }
                  },
                ),
              ),
            ],
          ),
      ChatBotWidget(),
      ]
      ),
        ),
    );
  }
}
