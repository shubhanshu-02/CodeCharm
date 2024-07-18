import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatBotWidget extends StatefulWidget {
  const ChatBotWidget({super.key});

  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  bool isExpanded = false;
  bool isHovered = false;
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _toggleChat() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: isExpanded ? 75.0 : 20.0,
          right: 20.0,
          width: 300.0,
          height: isExpanded ? 400.0 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: isExpanded
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(35.0, 10.0, 10.0, 15.0),
                          itemCount: _messages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: navColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(_messages[index],style: const TextStyle(fontFamily: "ProductSans",fontSize: 18),),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                style: const TextStyle(fontFamily: "ProductSans",fontSize: 16,),
                                decoration: const InputDecoration(
                                  hintText: 'Enter your message',hintStyle: TextStyle(fontFamily: "ProductSans",fontSize: 16,),
                                  border: OutlineInputBorder(),
                                ),
                                onSubmitted: (_) => _sendMessage(),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: _sendMessage,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : null,
          ),
        ),

        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: GestureDetector(
            onTap: _toggleChat,
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              cursor: SystemMouseCursors.click,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                  child: isExpanded
                      ? const Icon(
                          Icons.close,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                ),
            ),
            ),
          ),
      ],
    );
  }
}
