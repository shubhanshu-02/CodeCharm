import 'package:flutter/material.dart';

class NavDrawerItem extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const NavDrawerItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  _NavDrawerItemState createState() => _NavDrawerItemState();
}

class _NavDrawerItemState extends State<NavDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontFamily: "ProductSans", fontSize: 22,color:Colors.white),
        ),
        onTap: () {
          widget.onPressed();
        },
      ),
    );
  }
}
