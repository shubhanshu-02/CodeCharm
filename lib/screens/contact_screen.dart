// lib/screens/contact_screen.dart
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Phone',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Submit contact form
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
