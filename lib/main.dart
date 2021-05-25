import 'package:flutter/material.dart';
import 'quiz.dart';

Quiz quiz = Quiz();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon trueIcon = Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon falseIcon = Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Icon> scoreKeeper = [];

  void saveAndGo2Next({bool clicked}) {
    // check answer, add relevant icon
    if (clicked == quiz.getQuestionAnswerAt())
      scoreKeeper.add(trueIcon);
    else
      scoreKeeper.add(falseIcon);

    // go to next question
    quiz.go2Next();
  }

  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionTextAt(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  saveAndGo2Next(clicked: true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  // color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  saveAndGo2Next(clicked: false);
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
