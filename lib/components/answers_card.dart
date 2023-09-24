import 'package:flutter/material.dart';
import 'package:quiz_app/components/icons.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard(
      {super.key,
      required this.answers,
      required this.isSelected,
      required this.correctAnswerIndex,
      required this.selectedAnswerIndex,
      required this.currentIndex});
  final String answers;

  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: selectedAnswerIndex != null
          ? Container(
              padding: const EdgeInsets.all(20),
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 16, 34),
                border: Border.all(
                    color: isCorrectAnswer
                        ? Colors.green
                        : isWrongAnswer
                            ? Colors.red
                            : Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      answers,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  isCorrectAnswer
                      ? iconCorrect()
                      : isWrongAnswer
                          ? iconWrong()
                          : const SizedBox.shrink(),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(20),
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 16, 34),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    answers,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
