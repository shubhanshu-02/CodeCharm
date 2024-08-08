import 'package:flutter/material.dart';
import 'package:code_charm/components/heading.dart';
import 'package:code_charm/constants/colors.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          const Heading(title: "Team"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TeamMember(
                  imagePath: 'assets/shubh.png', 
                  name: 'Shubhanshu', 
                  role: 'Web/App Developer'),
              const SizedBox(width: 45),
              TeamMember(
                  imagePath: 'assets/dhruv.png', 
                  name: 'Dhruv', 
                  role: 'Chief Executive Head'),
              const SizedBox(width: 45),
              TeamMember(
                  imagePath: 'assets/lakshya.png', 
                  name: 'Lakshya', 
                  role: 'Backend Developer'),
            ],
          ),
          // const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class TeamMember extends StatefulWidget {
  final String imagePath;
  final String name;
  final String role;

  const TeamMember({super.key, 
    required this.imagePath,
    required this.name,
    required this.role,
  });

  @override
  _TeamMemberState createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        onEnter: (_) {
          _controller.forward(); // Zoom in
        },
        onExit: (_) {
          _controller.reverse(); // Zoom out
        },
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  border: Border.all(color: navColor, width: 4),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                     BoxShadow(
                      color: primaryColor,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 325, maxWidth: 175),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.asset(
                              widget.imagePath,
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans',
                            ),
                          ),
                          Text(
                            widget.role,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[600],
                              fontFamily: 'ProductSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
