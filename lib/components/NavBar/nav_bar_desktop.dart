// import 'package:code_charm/components/logo.dart';
// import 'package:code_charm/components/NavBar/nav_bar_item.dart';
// import 'package:code_charm/screens/clients_screen.dart';
// import 'package:code_charm/screens/contact_screen.dart';
// import 'package:code_charm/screens/ProductScreen/product_screen.dart';
// import 'package:code_charm/screens/team_screen.dart';
// import 'package:flutter/material.dart';

// class NavBarDesktop extends StatelessWidget {
//   const NavBarDesktop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  const SizedBox(
//       height: 100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Logo(),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//              NavBarItem(
//                 title: "Products",
//                 targetScreen: ProductScreen(
//                   productImage: 'assets/sakral.png',
//                   productDetail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ", // Replace with your image path
//                   productName: 'Sakral Associates',
//                   googlePlayLink: 'https://play.google.com/store/apps/details?id=com.tanxe.sakral_ca&hl=en',
//                   figmaLink: 'https://www.figma.com/',
//                 ),
//               ),
//               SizedBox(width: 25),
//               NavBarItem(title: "Clients",targetScreen: ClientsScreen(),),
//               SizedBox(width: 25),
//               NavBarItem(title: "Team", targetScreen: TeamScreen(),),
//               SizedBox(width: 25),
//               NavBarItem(title: "Contact us", targetScreen: ContactScreen(),),
//               SizedBox(width: 15),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }