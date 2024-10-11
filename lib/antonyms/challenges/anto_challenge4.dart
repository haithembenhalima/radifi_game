import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/utils/functions.dart';
import '../data/Anto_step1data.dart';
import '../data/anto_step2data.dart';
import '../data/anto_step3data.dart';
import '../data/anto_step4data.dart';
import '../data/anto_step5data.dart';
import '../data/anto_step6data.dart';
import '../../score.dart';
import '../statics_indexes.dart';
import '../../widgets/appbar.dart';
import '../step1.dart';
import '../step2.dart';
import '../step3.dart';
import '../step4.dart';
import '../step5.dart';
import '../step6.dart';

class AntoChallenge4 extends StatefulWidget {
  const AntoChallenge4({super.key});

  @override
  State<AntoChallenge4> createState() => _AntoChallenge4State();
}

TextEditingController _controller = TextEditingController();

// Variables
Color normalInputColor = Color.fromARGB(255, 235, 236, 236);
Color errorInputColor = Color.fromARGB(255, 219, 23, 23);

List questions = [];
String? word;
bool showHelpAlert = false;
int isHelpActivated = 0;
AntoStep1Data data1 = AntoStep1Data();
AntoStep2Data data2 = AntoStep2Data();
AntoStep3Data data3 = AntoStep3Data();
AntoStep4Data data4 = AntoStep4Data();
AntoStep5Data data5 = AntoStep5Data();
AntoStep6Data data6 = AntoStep6Data();
ScoreFunctions function = ScoreFunctions();

class _AntoChallenge4State extends State<AntoChallenge4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHelpActivated = 0;
    normalInputColor = Color.fromARGB(255, 235, 236, 236);
    // step1
    if (AntoStaticIndexes.step == 1 && AntoStaticIndexes.section == 8) {
      questions = data1.Step1Section8;
    }

    if (AntoStaticIndexes.step == 2 && AntoStaticIndexes.section == 8) {
      questions = data2.Step2Section8;
    }

    if (AntoStaticIndexes.step == 3 && AntoStaticIndexes.section == 8) {
      questions = data3.Step3Section8;
    }

    if (AntoStaticIndexes.step == 4 && AntoStaticIndexes.section == 8) {
      questions = data4.Step4Section8;
    }

    if (AntoStaticIndexes.step == 5 && AntoStaticIndexes.section == 8) {
      questions = data5.Step5Section8;
    }

    if (AntoStaticIndexes.step == 6 && AntoStaticIndexes.section == 8) {
      questions = data6.Step6Section8;
    }

    if (AntoStaticIndexes.index == 0) word = questions[0]['word'];
  }

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
          appBarWidgetChallenge(
            score: Score.antoScore,
          ),
          // **************************
          // *************************
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${Score.antoHelp}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    IconButton(
                      iconSize: 26,
                      color: Colors.yellow,
                      onPressed: () {
                        setState(() {
                          showHelpAlert = true;
                        });
                      },
                      icon: Icon(Icons.help),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ":اكتب ضدّ الكلمة ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${word}",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 88, 88, 88),
                          blurRadius: 10.0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 235, 236, 236),
                  ),
                ),
              ),
              // **************************
              // *************************
              Theme(
                data:
                    Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 28.0, bottom: 8, left: 55, right: 55),
                  child: TextField(
                    autofocus: false,
                    controller: _controller,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    mouseCursor: MouseCursor.uncontrolled,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Color.fromARGB(255, 17, 17, 17),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.cancel,
                          color: Color.fromARGB(255, 255, 99, 99),
                        ),
                        onTap: () {
                          setState(() {
                            _controller.clear();
                            normalInputColor =
                                Color.fromARGB(255, 235, 236, 236);
                          });
                        },
                      ),
                      fillColor: normalInputColor,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 236, 236)),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 235, 236, 236)),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              // **************************
              // *************************
              Wrap(
                spacing: 17,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          print(_controller.text);
                          if (_controller.text ==
                              questions[AntoStaticIndexes.index]["Anto"]) {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/correct-answer.mp3"),
                              autoStart: true,
                              showNotification: false,
                            );
                            _exitAlert(context);
                          } else {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio("assets/fail-answer.mp3"),
                              autoStart: true,
                              showNotification: false,
                            );
                            normalInputColor = errorInputColor;
                          }

                          if (AntoStaticIndexes.index == 5) {
                            _controller.clear();
                            AntoStaticIndexes.index = 0;

                            // ********************************
                            // ********************************
                            // Increment the score value
                            // Score of the step 1
                            if (AntoStaticIndexes.step == 1 &&
                                AntoStaticIndexes.section == 5 &&
                                Score.antoScore < 50) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection6 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 1 &&
                                AntoStaticIndexes.section == 6 &&
                                Score.antoScore < 60) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection7 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 1 &&
                                AntoStaticIndexes.section == 7 &&
                                Score.antoScore < 70) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection8 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 1 &&
                                AntoStaticIndexes.section == 8 &&
                                Score.antoScore < 80) {
                              Score.antoScore += 10;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 2

                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 5 &&
                                Score.antoScore < 130) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection6 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 6 &&
                                Score.antoScore < 140) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection7 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 7 &&
                                Score.antoScore < 150) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection8 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 8 &&
                                Score.antoScore < 160) {
                              Score.antoScore += 10;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 3

                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 5 &&
                                Score.antoScore < 210) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection6 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 6 &&
                                Score.antoScore < 220) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection7 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 7 &&
                                Score.antoScore < 230) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection8 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 8 &&
                                Score.antoScore < 240) {
                              Score.antoScore += 10;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 4

                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 5 &&
                                Score.antoScore < 290) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection6 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 6 &&
                                Score.antoScore < 300) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection7 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 7 &&
                                Score.antoScore < 310) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection8 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 8 &&
                                Score.antoScore < 320) {
                              Score.antoScore += 10;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 5

                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 5 &&
                                Score.antoScore < 370) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection6 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 6 &&
                                Score.antoScore < 380) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection7 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 7 &&
                                Score.antoScore < 390) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection7 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 8 &&
                                Score.antoScore < 400) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection8 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 6

                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 5 &&
                                Score.antoScore < 450) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection6 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 6 &&
                                Score.antoScore < 460) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection7 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 7 &&
                                Score.antoScore < 470) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection8 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 8 &&
                                Score.antoScore < 480) {
                              Score.antoScore += 10;
                              function.setScore("anto_score", Score.antoScore);
                            }

                            // ********************************
                            // ********************************

                            if (AntoStaticIndexes.step == 1) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AntoStep1()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (AntoStaticIndexes.step == 2) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AntoStep2()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (AntoStaticIndexes.step == 3) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AntoStep3()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (AntoStaticIndexes.step == 4) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AntoStep4()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (AntoStaticIndexes.step == 5) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AntoStep5()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (AntoStaticIndexes.step == 6) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AntoStep6()),
                                (Route<dynamic> route) => false,
                              );
                            }
                          }
                        });
                      },
                      child: Text(
                        "تأكيد",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 84, 206, 169))),
                ],
              )
            ],
          ),

          Visibility(
            visible: showHelpAlert,
            child: AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              icon: Icon(
                Icons.question_mark,
                size: 120,
                color: Color.fromARGB(255, 4, 151, 80),
              ),
              title: Text(
                "هل تريد استعمال مساعدة للحصول على تلميح؟",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 25),
              ),
              actions: <Widget>[
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 4, 151, 80))),
                  onPressed: () {
                    setState(() {
                      if (isHelpActivated == 0) {
                        _controller.clear();
                        _controller.text +=
                            questions[AntoStaticIndexes.index]["Anto"][0];
                        _controller.text +=
                            questions[AntoStaticIndexes.index]["Anto"][1];
                        isHelpActivated = 1;
                        Score.antoHelp--;
                        function.setScore("anto_help", Score.antoHelp);
                        showHelpAlert = false;
                      } else {
                        showHelpAlert = false;
                      }
                    });
                  },
                  child:
                      const Text("نعم", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 56, 56))),
                  onPressed: () {
                    setState(() {
                      showHelpAlert = false;
                    });
                  },
                  child: const Text(
                    "لا",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

_exitAlert(context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            icon: Icon(
              Icons.done,
              size: 120,
              color: Color.fromARGB(255, 4, 151, 80),
            ),
            title: Text(
              "جواب صحيح",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 30),
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 4, 151, 80)),
                ),
                onPressed: () {
                  AntoStaticIndexes.index++;
                  word = questions[AntoStaticIndexes.index]['word'];
                  _controller.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AntoChallenge4()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("التالي", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
