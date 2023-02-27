import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              "Let's Quizzz !",
              style: TextStyle(color: Colors.grey.shade900),
            ),
          ),
        ),
        body: Quizz(),
      ),
    );
  }
}

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 35,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  setState(() {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  });
                },
                child: Text(
                  "True",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 35,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  setState(() {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  });
                },
                child: Text(
                  "False",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
