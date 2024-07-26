import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child; 
  const CenteredView({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1250.0),
        child: child,
      ),
    );

  }
}
