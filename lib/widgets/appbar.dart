import 'package:flutter/material.dart';
import 'package:radifi_game/HomePage.dart';
import 'package:radifi_game/antonyms/statics_indexes.dart';
import 'package:radifi_game/plural/statics_indexes.dart';
import '../synonyms/statics_indexes.dart';

class appBarWidget extends StatelessWidget {
  const appBarWidget({
    super.key,
    required this.score, required this.onPressed,
  });
  final int score;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 10.0)],
            ),
            onPressed: onPressed,
            iconSize: 35,
            color: Colors.white,
          ),
        ),
        
        Row(
          children: [
            // **********************
            // **********************
            /*
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                "${score}",
                style: TextStyle(
                    fontSize: 28, color: Color.fromARGB(255, 233, 210, 9)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: IconButton(
                icon: Icon(
                  Icons.star,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black, blurRadius: 10.0)
                  ],
                ),
                onPressed: () {},
                iconSize: 35,
                color: Color.fromARGB(255, 233, 210, 9),
              ),
            ),
            */
            // *************************
            // *************************
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                "${score}",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: IconButton(
                icon: Icon(
                  Icons.auto_awesome,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black, blurRadius: 10.0)
                  ],
                ),
                onPressed: () {},
                iconSize: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ******************************
// ******************************

class appBarWidgetChallenge extends StatelessWidget {
  const appBarWidgetChallenge({
    super.key,
    required this.score,
  });
  final int score;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: IconButton(
            icon: Icon(
              Icons.close,
              shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 10.0)],
            ),
            onPressed: () {
              StaticIndexes.index = 0;
              AntoStaticIndexes.index = 0;
              pluralStaticIndexes.index = 0;
              _exitAlert(context);
            },
            iconSize: 35,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                "${score}",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: IconButton(
                icon: Icon(
                  Icons.auto_awesome,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black, blurRadius: 10.0)
                  ],
                ),
                onPressed: () {},
                iconSize: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Alert Dialog for quit the quizz
_exitAlert(context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.start,
            title: Text(
              "هل تريد الخروج ؟",
              textDirection: TextDirection.rtl,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("نعم", style: TextStyle(color: Colors.purple)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'لا'),
                child: const Text(
                  "لا",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ));
}
