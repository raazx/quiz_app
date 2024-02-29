import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/questions.dart';
import 'package:quiz_app/screen/resualt_screen.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  int salary = 1880;
 

  void answerQuestion(String selectedAnswer) {
    final questionProvider = Provider.of<Questions>(context, listen: false);
    questionProvider.chooseAnswer(selectedAnswer);
    if (questionProvider.selectedList.length == questionProvider.items.length) {
      Navigator.of(context).pushReplacementNamed(ResualtScreen.routeName);
    } else {
      setState(() {
        currentQuestionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questiondata =
        Provider.of<Questions>(context).items[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questiondata.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...questiondata
                .getshuffledAnswers()
                .map((e) => AnswerButton(
                    answerText: e,
                    onTap: () {
                      answerQuestion(e);
                    }))
                .toList()
          ],
        ),
      ),
    );
  }
}
