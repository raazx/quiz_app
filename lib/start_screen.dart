import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/question.png',
            width: 150,
            color: const Color.fromARGB(99, 173, 138, 179),
          ),
          Image.asset(
            'assets/images/pharma.png',
            width: 300,
          ),
          const SizedBox(height: 25),
          const Text(
            'Answer Non-pharma-Questions?',
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 50),
          TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18)),
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              label: const Text('start Quiz ')),
        ],
      ),
    );
  }
}
