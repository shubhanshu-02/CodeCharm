import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class NavDrawerHeader extends StatelessWidget {
  const NavDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/3.png"),
            fit: BoxFit.cover,
          )),
      child: null, 
      // Padding(
      //   padding: EdgeInsets.only(top: 10.0),
      //   child: UserAccountsDrawerHeader(
      //       decoration: BoxDecoration(color: Colors.transparent),
      //       accountName: Text("test@gmail.com"),
      //       accountEmail: Text("test")),
      // ),
    );
  }
}
