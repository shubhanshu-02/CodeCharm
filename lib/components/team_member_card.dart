// lib/widgets/team_member_card.dart
import 'package:flutter/material.dart';

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;

  const TeamMemberCard({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 50),
            Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(role),
          ],
        ),
      ),
    );
  }
}
