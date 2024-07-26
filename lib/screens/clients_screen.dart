import 'package:code_charm/components/custom_appbar.dart';
import 'package:code_charm/components/custom_card.dart';
import 'package:flutter/material.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: 'Clients We Have Worked With'),
        body: const Padding(
          padding:  EdgeInsets.all(26.0),
          child: SingleChildScrollView(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(
                    height: 350.0, 
                    width: 300.0, 
                    child: CustomCard(
                      image: 'assets/s1.png',
                      title: 'Client 1',
                      subtitle: 'Project 1',
                      buttonText: 'project link',
                      url: 'https://www.google.com/',
                    ),
                  ),
                  
                   SizedBox(width: 15.0), // Add spacing between cards
                  
                   SizedBox(
                    height: 350,
                    width: 300.0, // Set the desired width
                    child: CustomCard(
                      image: 'assets/4.png',
                      title: 'Client 2',
                      subtitle: 'Project 2',
                      url: 'https://www.gmail.com/',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
