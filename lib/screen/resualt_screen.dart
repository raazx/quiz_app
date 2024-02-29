import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/questions.dart';
import 'package:quiz_app/widgets/question_summry.dart';

class ResualtScreen extends StatelessWidget {
  static const routeName = '/result';
  const ResualtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<Questions>(context);
    final summry = questionProvider.getSummryData();
    final userCorrectnum = summry.where((element) {
      return element['user-answer'] == element['correct-answer'];
    }).length;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Your Summry Questions',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Your answered $userCorrectnum out of ${questionProvider.items.length} questions corrictly!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                const Divider(),
                const SizedBox(height: 30),
                Column(
                  children: [QuestionSummry(summry: summry)],
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/');
                      questionProvider.cleanList();
                    },
                    icon: const Icon(Icons.restart_alt),
                    label: const Text('Restart Quiz'))
              ],
            ),
          ),
        ));
  }
}
