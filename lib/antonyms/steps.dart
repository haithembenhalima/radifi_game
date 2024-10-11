import 'package:flutter/material.dart';
import 'package:radifi_game/CategoriesGame.dart';
import 'package:radifi_game/score.dart';
import 'statics_indexes.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';

class AntoSteps extends StatelessWidget {
  const AntoSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // **************************
          // *************************
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("images/pic2-2.png"),
                    fit: BoxFit.cover)),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 150.0),
          ),
          // **************************
          // *************************
          appBarWidget(
            score: Score.antoScore,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => CategoriesGame()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          // **************************
          // *************************

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    StepButton(
                      title: "المرحلة 1",
                      onPressed: () async {
                        Navigator.of(context).pushNamed("anto_step1");
                        AntoStaticIndexes.step = 1;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 2",
                      onPressed: () {
                        Navigator.of(context).pushNamed("anto_step2");
                        AntoStaticIndexes.step = 2;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 3",
                      onPressed: () {
                        Navigator.of(context).pushNamed("anto_step3");
                        AntoStaticIndexes.step = 3;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 4",
                      onPressed: () {
                        Navigator.of(context).pushNamed("anto_step4");
                        AntoStaticIndexes.step = 4;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 5",
                      onPressed: () {
                        Navigator.of(context).pushNamed("anto_step5");
                        AntoStaticIndexes.step = 5;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 6",
                      onPressed: () {
                        Navigator.of(context).pushNamed("anto_step6");
                        AntoStaticIndexes.step = 6;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
