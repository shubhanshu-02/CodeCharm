import 'package:flutter/material.dart';

class NavDrawerItem extends StatelessWidget {
  final String title;
  final Widget targetScreen;

  const NavDrawerItem({
    super.key,
    required this.title,
    required this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetScreen,
          ),
        );
      },
    );
  }
}