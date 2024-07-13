import 'package:code_charm/components/logo.dart';
import 'package:code_charm/components/NavBar/nav_bar_item.dart';
import 'package:flutter/material.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              NavBarItem(title: "Products"),
              SizedBox(width: 25),
              NavBarItem(title: "Clients"),
              SizedBox(width: 25),
              NavBarItem(title: "Team"),
              SizedBox(width: 25),
              NavBarItem(title: "contact us"),
              SizedBox(width: 15),
            ],
          )
        ],
      ),
    );
  }
}

