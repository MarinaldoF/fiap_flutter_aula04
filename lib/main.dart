import 'package:aula4/quiz/model/finished_quiz_screen.dart';
import 'package:aula4/quiz/model/quiz_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: QuizScreen.id,
      routes: {
        QuizScreen.id: (context) => const QuizScreen(),
        FinishedQuizScreen.id: (context) => FinishedQuizScreen(
              arguments: ModalRoute.of(context)?.settings.arguments
                  as FinishedQuizScreenArguments,
            ),
      },
    );
  }
}
