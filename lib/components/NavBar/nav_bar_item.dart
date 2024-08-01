import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  const NavBarItem({super.key, required this.title, required this.onPressed});

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { widget.onPressed(); },
      child: MouseRegion(
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: isHovered ? Colors.white : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "ProductSans",
              fontSize: 20,
              color: isHovered ? primaryColor : Colors.white,
              fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }
}
