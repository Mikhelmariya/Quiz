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
  int ans = 0;
  List<bool> answers = [
    true,
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    false
  ];
  List<String> questions = [
    "The blue whale is the biggest animal to have ever lived.T",
    "The hummingbird egg is the world's smallest bird egg.",
    "Bats are blind",
    "Infants have more bones than adults.",
    "Taste buds can only be found on the tongue.",
    "It took eight months from start to finish to produce the 1959 Disney film, Sleeping Beauty",
    "Toy Story was Pixar\’s first movie.",
    "Minnie Mouse\’s full name is Wilhelmina Mouse.",
    "A potato was the first vegetable to be planted on the space shuttle.",
    "The average human sneeze can be clocked at 100 miles an hour",
    "Human skin regenerates every week.",
    "French fries originated from France."
  ];
  int index = 0;

  String text = "The blue whale is the biggest animal to have ever lived";
  String changeText() {
    index = index + 1;
    if (index <= 11) {
      text = questions[index];

      return text;
    } else {
      text = "Thank you for playing !!";
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
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
                    changeText();
                    print(answers[ans]);
                    if (answers[ans] == true) {
                      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                    } else {
                      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                    }
                    ans++;
                    //scoreKeeper.add(Icon(Icons.check, color: Colors.green));
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
                    changeText();
                    if (answers[ans] == false) {
                      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                    } else {
                      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                    }
                    ans++;
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
