import 'package:code_charm/components/navDrawer/nav_drawer_item.dart';
// import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const NavDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 62, 41),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // const NavDrawerHeader(),
          const SizedBox(height: 10),
          NavDrawerItem(
            title: 'Home',
            onPressed: () => onItemSelected(1),
          ),
          NavDrawerItem(
            title: 'Services',
            onPressed: () => onItemSelected(2),
          ),
          NavDrawerItem(
            title: 'Contact us',
            onPressed: () => onItemSelected(3),
          ),
          NavDrawerItem(
            title: 'Our Clients',
            onPressed: () => onItemSelected(4),
          ),
          NavDrawerItem(
            title: 'Team',
            onPressed: () => onItemSelected(5),
          ),
          NavDrawerItem(
            title: 'FAQ',
            onPressed: () => onItemSelected(6),
          ),
        ],
      ),
    );
  }
}
