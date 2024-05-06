import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  QuizScreen();

  _QuizScreenState createState() => _QuizScreenState();
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
  int num = Random().nextInt(3);
  int CorrectAnswers = 0;
  int WrongAnswers = 0;
  @override
  void initState() {
    super.initState();
    countries.shuffle();
  }

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
                "${countries[num]}",
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              bayrambutton(
                name: countries[0],
                onpressed: () {
                  setState(() {
                    if (num == 0) {
                      Fluttertoast.showToast(
                        msg: "Correct Answer",
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.blueGrey,
                      );
                      CorrectAnswers++;
                    } else {
                      Fluttertoast.showToast(
                        msg: "Wrong Answer",
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.blueGrey,
                      );
                      WrongAnswers++;
                    }
                    countries.shuffle();
                    num = Random().nextInt(3);
                  });
                },
              ),
              bayrambutton(
                name: countries[1],
                onpressed: () {
                  setState(() {
                    if (num == 1) {
                      Fluttertoast.showToast(
                        msg: "Correct Answer",
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.blueGrey,
                      );
                      CorrectAnswers++;
                    } else {
                      Fluttertoast.showToast(
                        msg: "Wrong Answer",
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.blueGrey,
                      );

                      WrongAnswers++;
                    }
                    countries.shuffle();
                    num = Random().nextInt(3);
                  });
                },
              ),
              bayrambutton(
                name: countries[2],
                onpressed: () {
                  setState(() {
                    if (num == 2) {
                      Fluttertoast.showToast(
                        msg: "Correct Answer",
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.blueGrey,
                      );
                      CorrectAnswers++;
                    } else {
                      Fluttertoast.showToast(
                        msg: "Wrong Answer",
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.blueGrey,
                      );
                      WrongAnswers++;
                    }
                    countries.shuffle();
                    num = Random().nextInt(3);
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucScreen(
                                  CorrectAnswers: CorrectAnswers,
                                  WrongAnswers: WrongAnswers,
                                )));
                  },
                  child: Text(
                    "Result",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class bayrambutton extends StatelessWidget {
  const bayrambutton({
    super.key,
    required this.name,
    required this.onpressed,
  });

  final String name;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Image.asset(
        "Assets/Countries/$name.png",
        height: 150,
      ),
    );
  }
}

class SonucScreen extends StatelessWidget {
  SonucScreen({required this.CorrectAnswers, required this.WrongAnswers});
  int CorrectAnswers = 0;
  int WrongAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Correct Answers: $CorrectAnswers ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Wrong Answers:  $WrongAnswers",
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
