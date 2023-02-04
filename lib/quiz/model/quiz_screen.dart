import 'package:aula4/quiz/components/question_button.dart';
import 'package:aula4/quiz/model/finished_quiz_screen.dart';
import 'package:aula4/quiz/model/question_model.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const String id = '/quiz_screen';
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions = [];
  List<QuestionModel> loadQuestions() {
    return [
      QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'India', 'Argentina', 'Brasil', 'Etiopia'],
          answer: 3),
      QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'India', 'Argentina', 'Brasil', 'Etiopia'],
          answer: 3),
      QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'India', 'Argentina', 'Brasil', 'Etiopia'],
          answer: 3),
      QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'India', 'Argentina', 'Brasil', 'Etiopia'],
          answer: 3),
      QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'India', 'Argentina', 'Brasil', 'Etiopia'],
          answer: 3),
      QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'India', 'Argentina', 'Brasil', 'Etiopia'],
          answer: 3),
    ];
  }

  var questionIndex = 0;
  var score = 0;

  @override
  void initState() {
    super.initState();
    questions = loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.question),
              const SizedBox(height: 32),
              ListView.separated(
                itemCount: currentQuestion.options.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return QuestionButton(
                      text: currentQuestion.options[index],
                      onPressed: () {
                        onOptionPressed(index);
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void onOptionPressed(int selectedOption) {
    final currentQuestion = questions[questionIndex];

    if (selectedOption == currentQuestion.answer) {
      score++;
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (questionIndex == questions.length - 1) {
      Navigator.pushReplacementNamed(
        context,
        FinishedQuizScreen.id,
        arguments: FinishedQuizScreenArguments(
          score: score,
        ),
      );
    } else {
      setState(() {
        questionIndex++;
      });
    }
  }
}
