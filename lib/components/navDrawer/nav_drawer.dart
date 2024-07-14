import 'package:code_charm/components/navDrawer/drawer_item.dart';
import 'package:code_charm/components/navDrawer/nav_drawer_header.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          NavDrawerHeader(),
          DrawerItem(title: 'Episodes', icon: Icons.videocam),
          DrawerItem(title: 'About', icon: Icons.help),
        ],
      ),
    );
  }
}



