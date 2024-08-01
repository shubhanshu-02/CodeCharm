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
    FAQItem(question: 'Why should I choose 100xDevs?', answer: '100xDevs offers expert instruction and comprehensive materials to help you succeed in remote work, open source, and landing jobs.'),
    FAQItem(question: 'Who will be teaching me?', answer: 'Learn from the best. Harkirat is the top instructor in India for remote work, open source, and landing jobs.'),
    FAQItem(question: 'Is 100xDevs suitable for beginners?', answer: 'Yes, 100xDevs is designed to be suitable for beginners with step-by-step guidance and support.'),
    FAQItem(question: 'Will I get additional course materials than recordings?', answer: 'Yes, you will get additional course materials including notes, assignments, and project resources.'),
    FAQItem(question: 'What is the refund policy?', answer: 'We offer a full refund within the first 30 days if you are not satisfied with the course.'),
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: faq.isExpanded ? navColor : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(
                faq.question,
                style: const TextStyle(color: Colors.white, fontSize: 18),
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
                style: const TextStyle(color: Colors.grey, fontSize: 16),
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
