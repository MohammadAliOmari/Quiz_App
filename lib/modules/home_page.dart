import 'package:flutter/material.dart';
import 'package:quiz_app/components/answers_card.dart';
import 'package:quiz_app/components/button.dart';
import 'package:quiz_app/model/question_list.dart';
import 'package:quiz_app/modules/result_page.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  int questionindex = 0;
  int? selectedIndex;
  int score = 0;
  void picanswer(int value) {
    selectedIndex = value;
    final question = questionList[questionindex];
    if (selectedIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void gotonextquestion() {
    if (questionindex < questionList.length - 1) {
      questionindex++;
      selectedIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final qusitonsList = questionList[questionindex];
    bool isLastQuestion = questionindex == questionList.length - 1;
    return Scaffold(
      backgroundColor: const Color(0xff081235),
      appBar: AppBar(
        backgroundColor: const Color(0xff081235),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Quiz App',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              qusitonsList.question,
              style: const TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              itemCount: qusitonsList.options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedIndex == null
                      ? () {
                          picanswer(index);
                        }
                      : null,
                  child: AnswerCard(
                    answers: qusitonsList.options[index],
                    currentIndex: index,
                    isSelected: selectedIndex == index,
                    correctAnswerIndex: qusitonsList.correctAnswerIndex,
                    selectedAnswerIndex: selectedIndex,
                  ),
                );
              },
            ),
            isLastQuestion
                ? Button(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ResulltPage(score: score),
                        ),
                      );
                    },
                    label: 'Finish')
                : Button(
                    onPressed: selectedIndex != null ? gotonextquestion : null,
                    label: 'Next')
          ],
        ),
      ),
    );
  }
}
