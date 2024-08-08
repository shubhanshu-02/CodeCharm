import 'package:code_charm/components/heading.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final PageController _pageController =
      PageController(initialPage: 500, viewportFraction: 0.5); // Adjust viewportFraction for 4 images
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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildServiceCard(
      String imagePath, double scale, String url, int index, bool shouldOpenUrl) {
    bool isFocused = (_currentPage == index);

    return Transform.scale(
      scale: scale,
      child: MouseRegion(
        cursor: isFocused ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: () {
            if (shouldOpenUrl) {
              _onCardTap(url, index);
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0), // Adjust margin for 4 images
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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;

        List<String> imagePaths = isMobile
            ? ['assets/MS1.png', 'assets/MS2.png', 'assets/MS3.png', 'assets/MS4.png']
            : ['assets/DS1.png', 'assets/DS2.png', 'assets/DS3.png', 'assets/DS4.png'];

        List<String> urls = [
          'https://www.google.com',
          'https://www.example.com',
          'https://www.flutter.dev',
          'https://www.github.com',
        ];

        bool enableUrlRedirection = false; // Set this based on your logic

        return SizedBox(
          height: 700,
          child: Column(
            children: [
              const Heading(title: "Services"),
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        int realIndex = index % imagePaths.length;
                        double scale = (_currentPage == index) ? 1.0 : 0.8; // Adjust scale for side items

                        return _buildServiceCard(
                            imagePaths[realIndex], scale, urls[realIndex], index, enableUrlRedirection);
                      },
                    ),
                    Positioned(
                      left: 10,
                      top: MediaQuery.of(context).size.height / 2 - 40,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: _previousPage,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: MediaQuery.of(context).size.height / 2 - 40,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onPressed: _nextPage,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imagePaths.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentPage % imagePaths.length == index ? 12.0 : 8.0,
                    height: _currentPage % imagePaths.length == index ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage % imagePaths.length == index ? primaryColor : Colors.grey,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
