import 'package:flutter/material.dart';
import 'package:quiz_app/modules/home_page.dart';

class ResulltPage extends StatelessWidget {
  final int score;
  const ResulltPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff081235),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          const Center(
            child: Text(
              textAlign: TextAlign.center,
              'Your Score',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score / 10,
                  color: score < 5
                      ? Colors.red
                      : score >= 5 && score < 7
                          ? Colors.orange
                          : Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Text(
                score.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 200,
            color: const Color.fromARGB(255, 3, 16, 34),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QuizHome(),
                  ),
                );
              },
              child: const Text(
                'Try Agian',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
