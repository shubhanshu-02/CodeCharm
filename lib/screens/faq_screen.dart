import 'package:code_charm/components/heading.dart';
import 'package:code_charm/constants/colors.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<FAQItem> _faqs = [
    FAQItem(question: 'I am a client. How can Code Charm help me with my projects?',
            answer: 'Code Charm is a development agency focused on delivering tech solutions. We offer comprehensive services covering front-end, back-end, DevOps, and server management.'),
    FAQItem(question: 'How do I sign up as a freelancer or client on Code Charm?',
            answer: 'You can reach us out from contact us section or DM us on LinkedIn.'),
    FAQItem(question: 'What types of projects does Code Charm specialize in?', 
    answer: 'Code-charm specializes in mobile and web application development and for organisations.'),
    FAQItem(question: 'Can Code Charm develop Android applications?', 
    answer: 'Yes we have develop Android applications that scale to thousands of users.'),
    FAQItem(question: 'Can Code Charm assist with both front-end and back-end development?',
     answer: 'Code Charm provides comprehensive support and services for every stage of development, including front-end, back-end, DevOps, and server services.'),
  ];

  void _toggleExpansion(int index) {
    setState(() {
      for (int i = 0; i < _faqs.length; i++) {
        _faqs[i].isExpanded = i == index ? !_faqs[i].isExpanded : false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(title: "FAQs"),
          Expanded(
            child: ListView.builder(
              itemCount: _faqs.length,
              itemBuilder: (context, index) {
                return FAQTile(
                  faq: _faqs[index],
                  onTap: () => _toggleExpansion(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final FAQItem faq;
  final VoidCallback onTap;

  const FAQTile({
    super.key,
    required this.faq,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: faq.isExpanded ? navColor : const Color.fromARGB(16, 255, 255, 255),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(
                faq.question,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'ProductSans',),
              ),
              trailing: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: faq.isExpanded
                    ? const Icon(Icons.remove, color: Colors.white, key: ValueKey(true))
                    : const Icon(Icons.add, color: Colors.white, key: ValueKey(false)),
              ),
              onTap: onTap,
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                faq.answer,
                style: TextStyle(color: Colors.grey[400], fontSize: 18,   fontFamily: 'Charter',),
              ),
            ),
            crossFadeState: faq.isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}
