import 'package:flutter/material.dart';

class ChatbotWidget extends StatefulWidget {
  const ChatbotWidget({Key? key}) : super(key: key);

  @override
  _ChatbotWidgetState createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget> {
  // Define initial position
  late double _bottomPosition;
  late double _rightPosition;

  @override
  void initState() {
    super.initState();
    // Initial position values (bottom right corner)
    _bottomPosition = 20.0;
    _rightPosition = 20.0;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _bottomPosition,
      right: _rightPosition,
      child: GestureDetector(
        onTap: () {
          // Handle tap (open/close chat, etc.)
        },
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
