import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/plural/steps.dart';
import 'package:radifi_game/score.dart';
import 'package:radifi_game/utils/functions.dart';
import 'statics_indexes.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';

class PluralStep2 extends StatefulWidget {
  const PluralStep2({super.key});

  @override
  State<PluralStep2> createState() => _Step2State();
}

class _Step2State extends State<PluralStep2> {
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
            score: Score.pluralScore,
            onPressed: () {
                                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PluralSteps()),
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
                  Navigator.of(context).pushNamed("plural_challenge2");
                  pluralStaticIndexes.section = 1;
                },
                isDisable: Score.pluralScore<80?true:false,
              ),
              sectionButton(
                title: "2",
                onPressed: () {
                  Navigator.of(context).pushNamed("plural_challenge3");
                  pluralStaticIndexes.section = 2;
                },
                isDisable: Score.pluralScore<90?true:false,
              ),
              sectionButton(
                title: "3",
                onPressed: () {
                  Navigator.of(context).pushNamed("plural_challenge2");
                  pluralStaticIndexes.section = 3;
                },
                isDisable: Score.pluralScore<100?true:false,
              ),
              sectionButton(
                title: "4",
                onPressed: () {
                  Navigator.of(context).pushNamed("plural_challenge3");
                  pluralStaticIndexes.section = 4;
                },
                isDisable: Score.pluralScore<110?true:false,
              ),
              sectionButton(
                title: "5",
                onPressed: () {
                  Navigator.of(context).pushNamed("plural_challenge1");
                  pluralStaticIndexes.section = 5;
                },
                isDisable: Score.pluralScore<120?true:false,
              ),
              sectionButton(
                title: "6",
                onPressed: () {
                  Navigator.of(context).pushNamed("plural_challenge1");
                  pluralStaticIndexes.section = 6;
                },
                isDisable: Score.pluralScore<130?true:false,
              ),
              sectionButton(
                title: "7",
                onPressed: () {
                  Navigator.of(context).pushNamed("plural_challenge1");
                  pluralStaticIndexes.section = 7;
                },
                isDisable: Score.pluralScore<140?true:false,
              ),
              sectionButton(
                title: "8",
                onPressed: () {
                  Navigator.of(context).pushNamed("plural_challenge4");
                  pluralStaticIndexes.section = 8;
                },
                isDisable: Score.pluralScore<150?true:false,
              ),
            ],
          ),
              
        if(pluralStaticIndexes.openSection2==1 || pluralStaticIndexes.openSection3==1 || pluralStaticIndexes.openSection4==1 || pluralStaticIndexes.openSection5==1 || pluralStaticIndexes.openSection6==1 || pluralStaticIndexes.openSection7==1 || pluralStaticIndexes.openSection8 == 1)
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
                    Score.pluralHelp += 2;
                    func.setScore("plural_help", Score.pluralHelp);
                    pluralStaticIndexes.openSection2 =0;
                    pluralStaticIndexes.openSection3 =0;
                    pluralStaticIndexes.openSection4 =0;
                    pluralStaticIndexes.openSection5 =0;
                    pluralStaticIndexes.openSection6 =0;
                    pluralStaticIndexes.openSection7 =0;
                    pluralStaticIndexes.openSection8 =0;
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
