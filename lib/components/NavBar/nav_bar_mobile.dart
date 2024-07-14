import 'package:code_charm/components/logo.dart';
import 'package:flutter/material.dart';

class NavBarMobile extends StatelessWidget {
  final Widget drawer;
  const NavBarMobile({super.key,required this.drawer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          const Logo(),
        ],
      ),
    );
  }
}