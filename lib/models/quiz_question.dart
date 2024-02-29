class QuizQuestion {
  QuizQuestion({required this.question, required this.choices});
  final String question;
  final List<String> choices;

  List<String> getshuffledAnswers() {
    final shuffledList = List.of(choices);
    shuffledList.shuffle();
    return shuffledList;
  }
}
