import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/score.dart';
import 'package:radifi_game/synonyms/steps.dart';
import 'package:radifi_game/utils/functions.dart';
import 'statics_indexes.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  bool isVisibleOpenSectionAlert = true;
  ScoreFunctions func = ScoreFunctions();
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
            score: Score.synoScore,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Steps()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          // **************************
          // *************************
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              sectionButton(
                title: "1",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge2");
                  StaticIndexes.section = 1;
                },
                isDisable: Score.synoScore < 240 ? true : false,
              ),
              sectionButton(
                title: "2",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge3");
                  StaticIndexes.section = 2;
                },
                isDisable: Score.synoScore < 250 ? true : false,
              ),
              sectionButton(
                title: "3",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge2");
                  StaticIndexes.section = 3;
                },
                isDisable: Score.synoScore < 260 ? true : false,
              ),
              sectionButton(
                title: "4",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge3");
                  StaticIndexes.section = 4;
                },
                isDisable: Score.synoScore < 270 ? true : false,
              ),
              sectionButton(
                title: "5",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge1_1");
                  StaticIndexes.section = 5;
                },
                isDisable: Score.synoScore < 280 ? true : false,
              ),
              sectionButton(
                title: "6",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge1_1");
                  StaticIndexes.section = 6;
                },
                isDisable: Score.synoScore < 290 ? true : false,
              ),
              sectionButton(
                title: "7",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge1_1");
                  StaticIndexes.section = 7;
                },
                isDisable: Score.synoScore < 300 ? true : false,
              ),
              sectionButton(
                title: "8",
                onPressed: () {
                  Navigator.of(context).pushNamed("syno_challenge4");
                  StaticIndexes.section = 8;
                },
                isDisable: Score.synoScore < 310 ? true : false,
              ),
            ],
          ),

          if (StaticIndexes.openSection2 == 1 ||
              StaticIndexes.openSection3 == 1 ||
              StaticIndexes.openSection4 == 1 ||
              StaticIndexes.openSection5 == 1 ||
              StaticIndexes.openSection6 == 1 ||
              StaticIndexes.openSection7 == 1 ||
              StaticIndexes.openSection8 == 1)
            Visibility(
              visible: isVisibleOpenSectionAlert,
              child: AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                icon: Icon(
                  Icons.stars,
                  size: 120,
                  color: Color.fromARGB(255, 177, 146, 8),
                ),
                title: Text(
                  "أحسنت، لقد تمّ فتح تحدي جديد",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 30),
                ),
                actions: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 177, 146, 8)),
                    ),
                    onPressed: () {
                      setState(() {
                        AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/congrats.mp3"),
                          autoStart: true,
                          showNotification: false,
                        );
                        isVisibleOpenSectionAlert = false;
                        Score.synoHelp += 2;
                        func.setScore("syno_help", Score.synoHelp);
                        StaticIndexes.openSection2 = 0;
                        StaticIndexes.openSection3 = 0;
                        StaticIndexes.openSection4 = 0;
                        StaticIndexes.openSection5 = 0;
                        StaticIndexes.openSection6 = 0;
                        StaticIndexes.openSection7 = 0;
                        StaticIndexes.openSection8 = 0;
                      });
                    },
                    child: const Text("حسنا",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
