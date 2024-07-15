import 'package:code_charm/components/logo.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class NavDrawerHeader extends StatelessWidget {
  const NavDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Logo(),
    );
  }
}
