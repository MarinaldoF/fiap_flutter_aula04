import 'package:flutter/material.dart';

class FinishedQuizScreen extends StatelessWidget {
  static const String id = '/finished_quiz';
  const FinishedQuizScreen({super.key, required this.arguments});

  final FinishedQuizScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parabéns!"),
      ),
      body: Center(
        child: Text(
          'Sua Pontuação foi de ${arguments.score}',
        ),
      ),
    );
  }
}

class FinishedQuizScreenArguments {
  FinishedQuizScreenArguments({required this.score});

  int score;
}
