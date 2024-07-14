import 'package:code_charm/constants/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final PageController _pageController = PageController(initialPage: 500, viewportFraction: 0.6);
  int _currentPage = 500;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _onCardTap(String url, int index) async {
    if (_currentPage == index) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  Widget _buildServiceCard(String imagePath, double scale, String url, int index) {
      bool isFocused = (_currentPage == index);
    
    return Transform.scale(
      scale: scale,
      child: MouseRegion(
      cursor: isFocused ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: () => _onCardTap(url, index),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10, bottom: 20.0, left: 10,right: 10),
      child: Scaffold(
        appBar: customAppBar(title: 'Services'),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      int realIndex = index % 3;
                      double scale = (_currentPage == index) ? 1.0 : 0.8; // Scale for side items
      
                      List<String> imagePaths = [
                        'assets/1.jpg',
                        'assets/3.png',
                        'assets/4.png',
                      ];
      
                      List<String> urls = [
                        'https://www.google.com',
                        'https://www.example.com',
                        'https://www.flutter.dev',
                      ];
      
                      return _buildServiceCard(imagePaths[realIndex], scale, urls[realIndex], index);
                    },
                  ),
                  Positioned(
                    left: 10,
                    top: MediaQuery.of(context).size.height / 2 - 40,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,color: Colors.white,),
                      onPressed: _previousPage,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: MediaQuery.of(context).size.height / 2 - 40,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                      onPressed: _nextPage,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentPage % 3 == index ? 12.0 : 8.0,
                  height: _currentPage % 3 == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage % 3 == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
