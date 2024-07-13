import 'package:flutter/material.dart';

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

  Widget _buildServiceCard(Color color, double scale) {
    return Transform.scale(
      scale: scale,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    int realIndex = index % 3;
                    double scale = (_currentPage == index)
                        ? 1.0
                        : 0.8; // Scale for side items

                    Color color = realIndex == 0
                        ? Colors.red
                        : (realIndex == 1 ? Colors.green : Colors.blue);

                    return _buildServiceCard(color, scale);
                  },
                ),
                Positioned(
                  left: 10,
                  top: MediaQuery.of(context).size.height / 2 - 40,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _previousPage,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height / 2 - 40,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
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
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: const Center(child: Text('Our Products')),
    );
  }
}
