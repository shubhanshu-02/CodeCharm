import 'package:code_charm/components/heading.dart';
import 'package:flutter/material.dart';
import 'package:code_charm/components/custom_card.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      // color: green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(title: "Our Clients"),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
              itemCount: 8, // Total number of items in the grid
              itemBuilder: (context, index) {
                // Map each index to the desired card
                switch (index) {
                  case 0: // Position (1,1)
                    return const CustomCard(
                      image: 'assets/CA.png',
                      title: 'Sakral Associates',
                      subtitle: 'Android App',
                      buttonText: 'project link',
                      // url: 'https://www.google.com/',
                    );
                  case 2: // Position (1,3)
                    return const CustomCard(
                      image: 'assets/HS.png',
                      title: 'Hosting Safari',
                      subtitle: 'Website',
                      url: 'https://www.gmail.com/',
                    );
                  case 5: // Position (2,2)
                    return const CustomCard(
                      image: 'assets/SF.png',
                      title: 'Stepp Forward',
                      subtitle: 'Android App',
                      url: 'https://www.example.com/',
                    );
                  case 7: // Position (2,4)
                    return const CustomCard(
                      image: 'assets/startup.png',
                      title: 'Several Startups',
                      subtitle: 'Apps and Websites',
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
