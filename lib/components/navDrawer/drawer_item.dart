import 'package:code_charm/components/NavBar/nav_bar_item.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({super.key, required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 30),
          NavBarItem(title: title,),
        ],
      ),
    );
  }
}
