import 'dart:math';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ResultScreen.dart';

// ignore: must_be_immutable
class QuizScreen extends StatefulWidget {
  QuizScreen();

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Monaco",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US",
  ];
  @override
  void initState() {
    countries.shuffle();

    super.initState();
  }

  int correctAnswers = 0;
  int wrongAnswers = 0;

  int num = Random().nextInt(3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                "Guess The Flag?",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                countries[num],
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              for (int j = 0; j < 3; j++)
                flagButton(
                  name: countries[j],
                  onPressed: () {
                    // Fluttertoast.showToast(msg: "Test");
                    if (num == j) {
                      correctAnswers++;
                    } else {
                      wrongAnswers++;
                    }
                    setState(() {
                      countries.shuffle();
                      num = Random().nextInt(3);
                    });
                  },
                ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          correctAnswers: correctAnswers,
                          wrongAnswers: wrongAnswers,
                        ),
                      ),
                    );
                  },
                  child: Text("Results"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class flagButton extends StatelessWidget {
  const flagButton({
    super.key,
    //required this.countries,
    required this.name,
    required this.onPressed,

    //required this.i,
  });
  //final int i;
  //final List<String> countries;
  final String name;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Image(
        image: AssetImage("asset/countries/$name.png"),
        height: 140,
      ),
    );
  }
}
