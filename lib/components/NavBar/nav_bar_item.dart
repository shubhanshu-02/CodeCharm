import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final String title;
  final Widget? targetScreen;
  const NavBarItem({super.key, required this.title, this.targetScreen});

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.targetScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.targetScreen!),
          );
        }
      },
      child: MouseRegion(
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: isHovered ? Colors.grey[300] : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              color: isHovered ? Colors.blue : Colors.black,
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
