import 'package:flutter/material.dart';

class QuestionSummry extends StatelessWidget {
  const QuestionSummry({super.key, required this.summry});
  final List<Map<String, Object>> summry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: summry.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 25),
                  child: CircleAvatar(
                      backgroundColor:
                          (data['user-answer'] == data['correct-answer'])
                              ? Colors.green
                              : Colors.redAccent,
                      child: Text('${(data['question_index'] as int) + 1}')),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['correct-answer'] as String,
                        style: const TextStyle(color: Colors.green),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user-answer'] as String,
                        style: TextStyle(
                            color:
                                (data['user-answer'] == data['correct-answer'])
                                    ? Colors.green
                                    : Colors.redAccent),
                      ),
                      Divider()
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
