import 'package:code_charm/components/navDrawer/nav_drawer_header.dart';
import 'package:code_charm/components/navDrawer/nav_drawer_item.dart';
import 'package:code_charm/screens/clients_screen.dart';
import 'package:code_charm/screens/contact_screen.dart';
import 'package:code_charm/screens/product_screen.dart';
import 'package:code_charm/screens/team_screen.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          NavDrawerHeader(),
          SizedBox(height: 5),
          NavDrawerItem(
            title: 'Products',
            targetScreen: const ProductScreen(
              productImage: 'assets/sakral.png',
              productDetail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ",
              productName: 'Sakral Associates',
              googlePlayLink: 'https://play.google.com/store/apps/details?id=com.tanxe.sakral_ca&hl=en',
              figmaLink: 'https://www.figma.com/',
            ),
          ),
          SizedBox(height: 5),
          NavDrawerItem(
            title: 'Clients',
            targetScreen: ClientsScreen(),
          ),
          SizedBox(height: 5),
          NavDrawerItem(
            title: 'Team',
            targetScreen: TeamScreen(),
          ),
          SizedBox(height: 5),
          NavDrawerItem(
            title: 'Contact us',
            targetScreen: ContactScreen(),
          ),
        ],
      ),
    );
  }
}
