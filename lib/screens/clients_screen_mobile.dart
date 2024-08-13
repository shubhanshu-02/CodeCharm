import 'dart:async'; // Import for Timer
import 'package:code_charm/components/custom_card.dart';
import 'package:code_charm/components/heading.dart';
import 'package:flutter/material.dart';
class ClientsScreenMobile extends StatefulWidget {
  const ClientsScreenMobile({super.key});

  @override
  _ClientsScreenMobileState createState() => _ClientsScreenMobileState();
}

class _ClientsScreenMobileState extends State<ClientsScreenMobile> {
  final List<Map<String, String>> _clients = [
    {'image': 'assets/CA.png', 'title': 'Sakral Associates', 'subtitle': 'Android App'},
    {'image': 'assets/HS.png', 'title': 'Hosting Safari', 'subtitle': 'Website'},
    {'image': 'assets/SF.png', 'title': 'Stepp Forward', 'subtitle': 'Android App'},
    {'image': 'assets/startup.png', 'title': 'Several Startups', 'subtitle': 'Apps and Websites'},
  ];

  late ScrollController _scrollController;
  Timer? _autoScrollTimer;
  // final double _itemWidth = 150; // Adjust based on your actual card width
  final Duration _scrollInterval = const Duration(milliseconds: 10); // Duration to scroll automatically

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreClients();
      }
    });

    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(_scrollInterval, (timer) {
      if (_scrollController.hasClients) {
        final currentScrollPosition = _scrollController.offset;
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final newScrollPosition = currentScrollPosition + 1; // Scroll by 1 pixel per interval

        if (newScrollPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0); // Loop back to start if reaching the end
        } else {
          _scrollController.jumpTo(newScrollPosition);
        }
      }
    });
  }

  void _loadMoreClients() {
    setState(() {
      _clients.addAll([
        {'image': 'assets/CA.png', 'title': 'Sakral Associates', 'subtitle': 'Android App'},
        {'image': 'assets/HS.png', 'title': 'Hosting Safari', 'subtitle': 'Website'},
        {'image': 'assets/SF.png', 'title': 'Stepp Forward', 'subtitle': 'Android App'},
        {'image': 'assets/startup.png', 'title': 'Several Startups', 'subtitle': 'Apps and Websites'},
      ]);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(title: "Our Clients"),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: _clients.length,
              itemBuilder: (context, index) {
                final client = _clients[index];
                return CustomCard(
                  image: client['image']!,
                  title: client['title']!,
                  subtitle: client['subtitle']!,
                  isMobile: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}