import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/score.dart';
import 'package:radifi_game/antonyms/steps.dart';
import 'package:radifi_game/utils/functions.dart';

import 'statics_indexes.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';

class AntoStep2 extends StatefulWidget {
  const AntoStep2({super.key});

  @override
  State<AntoStep2> createState() => _Step2State();
}

class _Step2State extends State<AntoStep2> {
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
            score: Score.antoScore,
            onPressed: () {
                                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AntoSteps()),
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
                  Navigator.of(context).pushNamed("anto_challenge2");
                  AntoStaticIndexes.section = 1;
                },
                isDisable: Score.antoScore<80?true:false,
              ),
              sectionButton(
                title: "2",
                onPressed: () {
                  Navigator.of(context).pushNamed("anto_challenge3");
                  AntoStaticIndexes.section = 2;
                },
                isDisable: Score.antoScore<90?true:false,
              ),
              sectionButton(
                title: "3",
                onPressed: () {
                  Navigator.of(context).pushNamed("anto_challenge2");
                  AntoStaticIndexes.section = 3;
                },
                isDisable: Score.antoScore<100?true:false,
              ),
              sectionButton(
                title: "4",
                onPressed: () {
                  Navigator.of(context).pushNamed("anto_challenge3");
                  AntoStaticIndexes.section = 4;
                },
                isDisable: Score.antoScore<110?true:false,
              ),
              sectionButton(
                title: "5",
                onPressed: () {
                  Navigator.of(context).pushNamed("anto_challenge1");
                  AntoStaticIndexes.section = 5;
                },
                isDisable: Score.antoScore<120?true:false,
              ),
              sectionButton(
                title: "6",
                onPressed: () {
                  Navigator.of(context).pushNamed("anto_challenge1");
                  AntoStaticIndexes.section = 6;
                },
                isDisable: Score.antoScore<130?true:false,
              ),
              sectionButton(
                title: "7",
                onPressed: () {
                  Navigator.of(context).pushNamed("anto_challenge1");
                  AntoStaticIndexes.section = 7;
                },
                isDisable: Score.antoScore<140?true:false,
              ),
              sectionButton(
                title: "8",
                onPressed: () {
                  Navigator.of(context).pushNamed("anto_challenge4");
                  AntoStaticIndexes.section = 8;
                },
                isDisable: Score.antoScore<150?true:false,
              ),
            ],
          ),
              
        if(AntoStaticIndexes.openSection2==1 || AntoStaticIndexes.openSection3==1 || AntoStaticIndexes.openSection4==1 || AntoStaticIndexes.openSection5==1 || AntoStaticIndexes.openSection6==1 || AntoStaticIndexes.openSection7==1 || AntoStaticIndexes.openSection8 == 1)
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
                    Score.antoHelp += 2;
                    func.setScore("anto_help", Score.antoHelp);
                    AntoStaticIndexes.openSection2 =0;
                    AntoStaticIndexes.openSection3 =0;
                    AntoStaticIndexes.openSection4 =0;
                    AntoStaticIndexes.openSection5 =0;
                    AntoStaticIndexes.openSection6 =0;
                    AntoStaticIndexes.openSection7 =0;
                    AntoStaticIndexes.openSection8 =0;
                  });
                  },
                  child:
                      const Text("حسنا", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
         )
        ],
      ),
    );
  }
}
