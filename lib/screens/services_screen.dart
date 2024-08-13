import 'package:code_charm/components/heading.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final PageController _pageController = PageController(
    initialPage: 500,
    viewportFraction: 0.5,
  );
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

  Widget _buildServiceCard(
    String imagePath,
    String text,
    double scale,
    int index,
    bool isMobile,
  ) {
    bool isFocused = (_currentPage == index);
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Transform.scale(
          scale: scale,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isFocused)
                AnimatedOpacity(
                  opacity: !isMobile ? (isHovered ? 1.0 : 0.0) : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Align(
                    alignment: isMobile ? Alignment.bottomCenter : Alignment.center,
                    child: Container(
                      padding: isMobile ? const EdgeInsets.all(10.0) : const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: isMobile ? Colors.black.withOpacity(0.4) : Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: isMobile ? 28 : 55,
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(color: Colors.white, offset: Offset(2, 2), blurRadius: 3),
                            Shadow(color: Colors.black, offset: Offset(-2, 2), blurRadius: 3),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              if (!isMobile)
                MouseRegion(
                  cursor: isFocused ? SystemMouseCursors.click : SystemMouseCursors.basic,
                  onEnter: (_) => setState(() => isHovered = true),
                  onExit: (_) => setState(() => isHovered = false),
                  child: const SizedBox.expand(), // Ensures the hover effect covers the card
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;

        List<String> imagePaths = [
          'assets/s1.png',
          'assets/s2.png',
          'assets/s3.png',
          'assets/s4.png'
        ];

        List<String> texts = [
          'Mobile App\nDevelopment',
          'Web\nDevelopment',
          'Technical\nDocumentation',
          'Blockchain\nSolana Ethereum',
        ];

        return SizedBox(
          height: isMobile ? 500 : 700,
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
                        double scale = (_currentPage == index) ? 1.0 : 0.8;

                        return _buildServiceCard(
                          imagePaths[realIndex],
                          texts[realIndex],
                          scale,
                          index,
                          isMobile,
                        );
                      },
                    ),
                    if (!isMobile)
                      Positioned(
                        left: 10,
                        top: 250,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: _previousPage,
                          ),
                        ),
                      ),
                    if (!isMobile)
                      Positioned(
                        right: 10,
                        top: 250,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onPressed: _nextPage,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imagePaths.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentPage % imagePaths.length == index ? 12.0 : 8.0,
                    height: _currentPage % imagePaths.length == index ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage % imagePaths.length == index
                          ? primaryColor
                          : Colors.grey,
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
