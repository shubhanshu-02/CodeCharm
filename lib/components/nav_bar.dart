import 'package:code_charm/components/NavBar/nav_bar_item.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemSelected;
  final String? userName;


  const NavBar({super.key, required this.onItemSelected, this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: navColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarItem(
            onPressed: () => onItemSelected(1),
            title: 'Services',
          ),
          NavBarItem(
            onPressed: () => onItemSelected(2),
            title: 'Contact Us',
          ),
          NavBarItem(
            onPressed: () => onItemSelected(3),
            title: 'Our Clients',
          ),
          NavBarItem(
            onPressed: () => onItemSelected(4),
            title: 'Team',
          ),
          NavBarItem(
            onPressed: () => onItemSelected(5),
            title: 'FAQs',
          ),
        ],
      ),
    );
  }
}
