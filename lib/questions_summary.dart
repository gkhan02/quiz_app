import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            // Display the question index (starting from 1)
            Text(((data['question_index'] as int) + 1).toString(), 
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            
            const SizedBox(width: 10), // Space between the index and the content
            
            // Expanded to allow the question and answers to take the remaining space
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the question text
                  Text(data['question'] as String),
                  
                  const SizedBox(height: 5),
                  
                  // Display the user answer
                  Text(
                    'Your answer: ${data['user_answer'] as String}',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  
                  // Display the correct answer
                  Text(
                    'Correct answer: ${data['correct_answer'] as String}',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
