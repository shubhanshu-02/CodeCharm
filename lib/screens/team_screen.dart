import 'package:code_charm/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: 'Team Members'),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTeamMember('assets/1.jpg', 'Shubhanshu', 'Web/App'),
                  const SizedBox(width: 20),
                  _buildTeamMember('assets/2.jpg', 'Dhruv', 'C.E.H'),
                  const SizedBox(width: 20),
                  _buildTeamMember('assets/3.png', 'Lakshya', 'Backend'),
                ],
              ),
              const SizedBox(height: 16.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     _buildTeamMember('assets/images/new_member1.png', 'New Member 1', 'Role 1'),
              //     _buildTeamMember('assets/images/new_member2.png', 'New Member 2', 'Role 2'),
              //     _buildTeamMember('assets/images/new_member3.png', 'New Member 3', 'Role 3'),
              //   ],
              // ),
            ],
          ),
        ),
    );
  }

  Widget _buildTeamMember(String imagePath, String name, String role) {
    return Expanded(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
