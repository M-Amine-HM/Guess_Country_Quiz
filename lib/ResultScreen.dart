import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  ResultScreen({required this.correctAnswers, required this.wrongAnswers});

  int correctAnswers;
  int wrongAnswers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Correct Answers: ${widget.correctAnswers}",
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Wrong Answers: ${widget.wrongAnswers}",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: Text(
                "Play Again",
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
