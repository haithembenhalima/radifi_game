import 'package:flutter/material.dart';
import 'package:radifi_game/score.dart';
import '../CategoriesGame.dart';
import 'statics_indexes.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';

class PluralSteps extends StatelessWidget {
  const PluralSteps({super.key});

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
            score: Score.pluralScore,
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
                        Navigator.of(context).pushNamed("plural_step1");
                        pluralStaticIndexes.step = 1;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 2",
                      onPressed: () {
                        Navigator.of(context).pushNamed("plural_step2");
                        pluralStaticIndexes.step = 2;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 3",
                      onPressed: () {
                        Navigator.of(context).pushNamed("plural_step3");
                        pluralStaticIndexes.step = 3;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 4",
                      onPressed: () {
                        Navigator.of(context).pushNamed("plural_step4");
                        pluralStaticIndexes.step = 4;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 5",
                      onPressed: () {
                        Navigator.of(context).pushNamed("plural_step5");
                        pluralStaticIndexes.step = 5;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    StepButton(
                      title: "المرحلة 6",
                      onPressed: () {
                        Navigator.of(context).pushNamed("plural_step6");
                        pluralStaticIndexes.step = 6;
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
