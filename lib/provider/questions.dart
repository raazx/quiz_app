import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';

class Questions with ChangeNotifier {
  final List<QuizQuestion> _questions = [
    QuizQuestion(
        question: "In child with ADHD what is the appropriate choice?",
        choices: [
          "Methylphenidate once daily",
          "guanfacine once daily",
          "Methylphenidate 6-time daily",
          "Methylphenidate prn"
        ]),
    QuizQuestion(question: 'what is equivalent to omeprazole 20 mg?', choices: [
      "Pantoprazole 40 mg",
      "esomeprazole 40 mg",
      "Ranitidine 300 mg daily"
    ]),
    QuizQuestion(question: 'Role of vitamin C in treating cold?', choices: [
      "Decrease the duration of cold",
      "Reduce severity of cold",
      "Treat the cold"
    ]),
    QuizQuestion(question: 'Neonates term?', choices: [
      "from birth to one month",
      "from birth to one-week",
      "from birth to two months",
      "from birth to one year",
    ]),
    QuizQuestion(
        question:
            'Vincristine fatal when given intrathecal what the process make safe from this error whiledispense to nurse ?',
        choices: [
          "dispense drug in piggyback",
          "dispense with needle",
          "dispense with syringe.",
          "prepare vincristine in 50 ml minibag",
        ]),
    QuizQuestion(
        question:
            'Which one of the p2y12 receptor inhibitors provides variable anti platelets effect?',
        choices: [
          "ticagrelor (non – thienopyridie) reversible inhibit of P2Y12 receptor",
          "teclopidine (theinopyridie) irreversible inhibit of P2Y12 receptor",
          "prasugrel (theinopyridie) irreversible inhibit of P2Y12 receptor",
          "clopidogrel (theinopyridie) irreversible inhibit of P2Y12 receptor",
        ]),
  ];

  final List<String> selectedList = [];

  List<QuizQuestion> get items {
    return [..._questions];
  }

  void chooseAnswer(String value) {
    selectedList.add(value);
    notifyListeners();
  }

  List<Map<String, Object>> getSummryData() {
    final List<Map<String, Object>> summry = [];
    for (var i = 0; i < selectedList.length; i++) {
      summry.add({
        'question_index': i,
        'question': items[i].question,
        'correct-answer': items[i].choices[0],
        'user-answer': selectedList[i]
      });
    }

    return summry;
  }

  cleanList() {
    selectedList.clear();
    notifyListeners();
  }
}
