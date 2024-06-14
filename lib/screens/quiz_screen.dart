import 'package:flutter/material.dart';

import '/models/questions.dart';
import '/screens/result_screen.dart';
// ignore: unused_import
import '/widgets/answer_card.dart';
import '/widgets/next_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geography'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/question_mark.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  question.questions,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(), // Adds space between the question and the answers
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      // ignore: unused_local_variable
                      bool isSelected = selectedAnswerIndex == index;
                      bool isCorrect = question.correctAnswerIndex == index;
                      bool isWrong = selectedAnswerIndex != null && selectedAnswerIndex == index && !isCorrect;

                      Color getBackgroundColor() {
                        if (selectedAnswerIndex == null) {
                          return Colors.black.withOpacity(0.6);
                        } else if (isCorrect) {
                          return Colors.green;
                        } else if (isWrong) {
                          return Colors.red;
                        } else {
                          return Colors.black.withOpacity(0.6);
                        }
                      }

                      return GestureDetector(
                        onTap: selectedAnswerIndex == null
                            ? () => pickAnswer(index)
                            : null,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: getBackgroundColor(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            question.options[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(), // Adds space between the answers and the button
                // Next Button
                isLastQuestion
                    ? RectangularButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => ResultScreen(
                          score: score,
                        ),
                      ),
                    );
                  },
                  label: 'Finish',
                )
                    : RectangularButton(
                  onPressed: selectedAnswerIndex != null ? goToNextQuestion : null,
                  label: 'Next',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
