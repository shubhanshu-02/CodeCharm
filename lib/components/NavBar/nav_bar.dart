import 'package:code_charm/components/NavBar/nav_bar_desktop.dart';
import 'package:code_charm/components/NavBar/nav_bar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 197, 202, 233), 
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return const NavBarDesktop();
          } 
          else {
            return const NavBarMobile();
          }
        }),
      ),
    );
  }
}
