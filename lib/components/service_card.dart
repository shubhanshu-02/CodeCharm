// lib/widgets/service_card.dart
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final int serviceNumber;

  const ServiceCard({super.key, required this.serviceNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Center(child: Text('Service $serviceNumber')),
      ),
    );
  }
}
