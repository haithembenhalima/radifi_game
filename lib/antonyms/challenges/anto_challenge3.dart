import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/utils/functions.dart';

import '../../score.dart';
import '../data/anto_step1data.dart';
import '../data/anto_step2data.dart';
import '../data/anto_step3data.dart';
import '../data/anto_step4data.dart';
import '../data/anto_step5data.dart';
import '../data/anto_step6data.dart';
import '../statics_indexes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/buttons.dart';
import '../step1.dart';
import '../step2.dart';
import '../step3.dart';
import '../step4.dart';
import '../step5.dart';
import '../step6.dart';

class AntoChallenge3 extends StatefulWidget {
  const AntoChallenge3({super.key});

  @override
  State<AntoChallenge3> createState() => _AntoChallenge3State();
}

TextEditingController _controller = TextEditingController();

// Variables
Color normalInputColor = Color.fromARGB(255, 235, 236, 236);
Color errorInputColor = Color.fromARGB(255, 219, 23, 23);

List questions = [];
String? word;
String? anto;
AntoStep1Data data1 = AntoStep1Data();
AntoStep2Data data2 = AntoStep2Data();
AntoStep3Data data3 = AntoStep3Data();
AntoStep4Data data4 = AntoStep4Data();
AntoStep5Data data5 = AntoStep5Data();
AntoStep6Data data6 = AntoStep6Data();
List<String>? characters;
bool showHelpAlert = false;
int isHelpActivated = 0;
ScoreFunctions function = ScoreFunctions();

class _AntoChallenge3State extends State<AntoChallenge3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHelpActivated = 0;
    normalInputColor = Color.fromARGB(255, 235, 236, 236);
    if (AntoStaticIndexes.step == 1 && AntoStaticIndexes.section == 2) {
      questions = data1.Step1Section2;
    }

    if (AntoStaticIndexes.step == 1 && AntoStaticIndexes.section == 4) {
      questions = data1.Step1Section4;
    }

    if (AntoStaticIndexes.step == 2 && AntoStaticIndexes.section == 2) {
      questions = data2.Step2Section2;
    }

    if (AntoStaticIndexes.step == 2 && AntoStaticIndexes.section == 4) {
      questions = data2.Step2Section4;
    }

    if (AntoStaticIndexes.step == 3 && AntoStaticIndexes.section == 2) {
      questions = data3.Step3Section2;
    }

    if (AntoStaticIndexes.step == 3 && AntoStaticIndexes.section == 4) {
      questions = data3.Step3Section4;
    }

    if (AntoStaticIndexes.step == 4 && AntoStaticIndexes.section == 2) {
      questions = data4.Step4Section2;
    }

    if (AntoStaticIndexes.step == 4 && AntoStaticIndexes.section == 4) {
      questions = data4.Step4Section4;
    }
    if (AntoStaticIndexes.step == 5 && AntoStaticIndexes.section == 2) {
      questions = data5.Step5Section2;
    }

    if (AntoStaticIndexes.step == 5 && AntoStaticIndexes.section == 4) {
      questions = data5.Step5Section4;
    }
    if (AntoStaticIndexes.step == 6 && AntoStaticIndexes.section == 2) {
      questions = data6.Step6Section2;
    }

    if (AntoStaticIndexes.step == 6 && AntoStaticIndexes.section == 4) {
      questions = data6.Step6Section4;
    }
    if (AntoStaticIndexes.index == 0) {
      word = questions[0]['word'];
      anto = questions[0]['Anto'];
      characters = anto?.split('');
      characters?.shuffle(Random());
    }
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
                        "رتّب الأحرف للحصول على ضدّ الكلمة",
                        style: TextStyle(
                          fontSize: 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${word}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                    readOnly: true,
                    controller: _controller,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Color.fromARGB(255, 17, 17, 17),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: InkWell(
                        child: Icon(
                          Icons.cancel,
                          color: const Color.fromARGB(255, 255, 99, 99),
                        ),
                        onTap: () {
                          setState(() {
                            _controller.clear();
                            normalInputColor =
                                Color.fromARGB(255, 235, 236, 236);
                          });
                        },
                      ),
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 255, 99, 99),
                        ),
                        onTap: () {
                          setState(() {
                            String currentText = _controller.text;
                            if (currentText.isNotEmpty) {
                              String newText = currentText.substring(
                                  0, currentText.length - 1);
                              _controller.text = newText;
                            }
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
                                AntoStaticIndexes.section == 1 &&
                                Score.antoScore < 10) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection2 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 1 &&
                                AntoStaticIndexes.section == 2 &&
                                Score.antoScore < 20) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection3 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 1 &&
                                AntoStaticIndexes.section == 3 &&
                                Score.antoScore < 30) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection4 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 1 &&
                                AntoStaticIndexes.section == 4 &&
                                Score.antoScore < 40) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection5 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 2

                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 1 &&
                                Score.antoScore < 90) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection2 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 2 &&
                                Score.antoScore < 100) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection3 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 3 &&
                                Score.antoScore < 110) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection4 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 2 &&
                                AntoStaticIndexes.section == 4 &&
                                Score.antoScore < 120) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection5 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 3

                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 1 &&
                                Score.antoScore < 170) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection2 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 2 &&
                                Score.antoScore < 180) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection3 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 3 &&
                                Score.antoScore < 190) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection4 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 3 &&
                                AntoStaticIndexes.section == 4 &&
                                Score.antoScore < 200) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection5 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 4

                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 1 &&
                                Score.antoScore < 250) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection2 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 2 &&
                                Score.antoScore < 260) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection3 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 3 &&
                                Score.antoScore < 270) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection4 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 4 &&
                                AntoStaticIndexes.section == 4 &&
                                Score.antoScore < 280) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection5 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 5

                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 1 &&
                                Score.antoScore < 330) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection2 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 2 &&
                                Score.antoScore < 340) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection3 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 3 &&
                                Score.antoScore < 350) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection4 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 5 &&
                                AntoStaticIndexes.section == 4 &&
                                Score.antoScore < 360) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection5 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            // Score of the step 6

                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 1 &&
                                Score.antoScore < 410) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection2 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 2 &&
                                Score.antoScore < 420) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection3 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 3 &&
                                Score.antoScore < 430) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection4 = 1;
                              function.setScore("anto_score", Score.antoScore);
                            }
                            if (AntoStaticIndexes.step == 6 &&
                                AntoStaticIndexes.section == 4 &&
                                Score.antoScore < 440) {
                              Score.antoScore += 10;
                              AntoStaticIndexes.openSection5 = 1;
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
                  /*        for (int i = 1; i <= anto!.length; i++)
                    LettersButton(
                      title: "${anto![anto!.length - i]}",
                      onPressed: () {
                        setState(() {
                          normalInputColor = Color.fromARGB(255, 235, 236, 236);
                          _controller.text =
                              _controller.text + "${anto![anto!.length - i]}";
                        });
                      },
                    ),
*/
                  for (String c in characters!)
                    LettersButton(
                      title: "${c == 'ه' ? c = 'هـ' : c}",
                      onPressed: () {
                        setState(() {
                          normalInputColor = Color.fromARGB(255, 235, 236, 236);
                          if (c == 'هـ') {
                            _controller.text = _controller.text + "ه";
                          } else {
                            _controller.text = _controller.text + "${c}";
                          }
                        });
                      },
                    ),
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
                  anto = questions[AntoStaticIndexes.index]['Anto'];

                  characters = anto?.split('');
                  characters?.shuffle(Random());
                  _controller.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AntoChallenge3()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("التالي", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
