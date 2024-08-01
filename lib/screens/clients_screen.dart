import 'package:code_charm/components/heading.dart';
import 'package:flutter/material.dart';
import 'package:code_charm/components/custom_card.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      // color: green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(title: "Our Clients"),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: 8, // Total number of items in the grid
              itemBuilder: (context, index) {
                // Map each index to the desired card
                switch (index) {
                  case 0: // Position (1,1)
                    return const CustomCard(
                      image: 'assets/s1.png',
                      title: 'Client 1',
                      subtitle: 'Project 1',
                      buttonText: 'project link',
                      // url: 'https://www.google.com/',
                    );
                  case 2: // Position (1,3)
                    return const CustomCard(
                      image: 'assets/4.png',
                      title: 'Client 2',
                      subtitle: 'Project 2',
                      url: 'https://www.gmail.com/',
                    );
                  case 5: // Position (2,2)
                    return const CustomCard(
                      image: 'assets/4.png',
                      title: 'Client 3',
                      subtitle: 'Project 3',
                      url: 'https://www.example.com/',
                    );
                  case 7: // Position (2,4)
                    return const CustomCard(
                      image: 'assets/4.png',
                      title: 'Client 4',
                      subtitle: 'Project 4',
                      url: 'https://www.example.org/',
                    );
                  default:
                    return const SizedBox.shrink(); // Empty space for other cells
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
