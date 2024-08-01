import 'package:code_charm/components/centered_view.dart';
import 'package:flutter/material.dart';

class JoinUsScreen extends StatefulWidget {
  const JoinUsScreen({super.key});

  @override
  _JoinUsScreenState createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  final _githubController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _whyJoinController = TextEditingController();
  int _currentIndex = 0;

  final List<String> _cards = [
    'Things we want from you',
    'Other Info 1',
    'Other Info 2'
  ];

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _cards.length;
    });
  }

  @override
  void dispose() {
    _githubController.dispose();
    _linkedinController.dispose();
    _whyJoinController.dispose();
    super.dispose();
  }

  void _submit() {
    // Handle the submission logic here
    print("Github: ${_githubController.text}");
    print("LinkedIn: ${_linkedinController.text}");
    print("Why Join: ${_whyJoinController.text}");
    // You can also send this data to a backend server or a database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Want to be a part of us?'),
      ),
      body: CenteredView(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: _cards.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String text = entry.value;
        
                  return Positioned.fill(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _currentIndex == idx
                          ? GestureDetector(
                              key: ValueKey<int>(idx),
                              onTap: _nextCard,
                              child: Card(
                                margin: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      text,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _githubController,
                      decoration: const InputDecoration(
                        labelText: 'GitHub',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _linkedinController,
                      decoration: const InputDecoration(
                        labelText: 'LinkedIn',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _whyJoinController,
                      decoration: const InputDecoration(
                        labelText: 'Why you want to join',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
