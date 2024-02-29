import 'package:flutter/material.dart';
import 'package:quiz_app/screen/question_screen.dart';
import 'package:quiz_app/screen/resualt_screen.dart';
import 'package:quiz_app/screen/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedScreen = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      selectedScreen = const QuestionScreen();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz pharma-App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 25),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 35, 4, 89),
              Color.fromARGB(255, 104, 75, 153),
            ])),
            child: selectedScreen),
      ),
      routes: <String, WidgetBuilder>{
        ResualtScreen.routeName: (context) => const ResualtScreen(),
      },
    );
  }
}
