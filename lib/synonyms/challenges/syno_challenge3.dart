import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/utils/functions.dart';

import '../../score.dart';
import '../data/syno_step2data.dart';
import '../data/syno_step3data.dart';
import '../data/syno_step4data.dart';
import '../data/syno_step5data.dart';
import '../data/syno_step6data.dart';
import '../statics_indexes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/buttons.dart';
import '../data/syno_step1data.dart';
import '../step1.dart';
import '../step2.dart';
import '../step3.dart';
import '../step4.dart';
import '../step5.dart';
import '../step6.dart';

class SynoChallenge3 extends StatefulWidget {
  const SynoChallenge3({super.key});

  @override
  State<SynoChallenge3> createState() => _SynoChallenge3State();
}

TextEditingController _controller = TextEditingController();

// Variables
Color normalInputColor = Color.fromARGB(255, 235, 236, 236);
Color errorInputColor = Color.fromARGB(255, 219, 23, 23);

List questions = [];
String? word;
String? syno;
SynoStep1Data data1 = SynoStep1Data();
SynoStep2Data data2 = SynoStep2Data();
SynoStep3Data data3 = SynoStep3Data();
SynoStep4Data data4 = SynoStep4Data();
SynoStep5Data data5 = SynoStep5Data();
SynoStep6Data data6 = SynoStep6Data();
List<String>? characters;
bool showHelpAlert = false;
int isHelpActivated = 0;
ScoreFunctions function = ScoreFunctions();

class _SynoChallenge3State extends State<SynoChallenge3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHelpActivated = 0;
    normalInputColor = Color.fromARGB(255, 235, 236, 236);
    // ******
    if (StaticIndexes.step == 1 && StaticIndexes.section == 2) {
      questions = data1.Step1Section2;
    }

    if (StaticIndexes.step == 1 && StaticIndexes.section == 4) {
      questions = data1.Step1Section4;
    }

    if (StaticIndexes.step == 2 && StaticIndexes.section == 2) {
      questions = data2.Step2Section2;
    }

    if (StaticIndexes.step == 2 && StaticIndexes.section == 4) {
      questions = data2.Step2Section4;
    }

    if (StaticIndexes.step == 3 && StaticIndexes.section == 2) {
      questions = data3.Step3Section2;
    }

    if (StaticIndexes.step == 3 && StaticIndexes.section == 4) {
      questions = data3.Step3Section4;
    }

    if (StaticIndexes.step == 4 && StaticIndexes.section == 2) {
      questions = data4.Step4Section2;
    }

    if (StaticIndexes.step == 4 && StaticIndexes.section == 4) {
      questions = data4.Step4Section4;
    }
    if (StaticIndexes.step == 5 && StaticIndexes.section == 2) {
      questions = data5.Step5Section2;
    }

    if (StaticIndexes.step == 5 && StaticIndexes.section == 4) {
      questions = data5.Step5Section4;
    }
    if (StaticIndexes.step == 6 && StaticIndexes.section == 2) {
      questions = data6.Step6Section2;
    }

    if (StaticIndexes.step == 6 && StaticIndexes.section == 4) {
      questions = data6.Step6Section4;
    }
    if (StaticIndexes.index == 0) {
      word = questions[0]['word'];
      syno = questions[0]['syno'];
      characters = syno?.split('');
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
            score: Score.synoScore,
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
                      "${Score.synoHelp}",
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
                        "رتّب الأحرف للحصول على مرادف الكلمة:",
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
                              questions[StaticIndexes.index]["syno"]) {
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

                          if (StaticIndexes.index == 5) {
                            _controller.clear();
                            StaticIndexes.index = 0;

                            // ********************************
                            // ********************************
                            // Increment the score value
                            // Score of the step 1

                            if (StaticIndexes.step == 1 &&
                                StaticIndexes.section == 1 &&
                                Score.synoScore < 10) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection2 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 1 &&
                                StaticIndexes.section == 2 &&
                                Score.synoScore < 20) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection3 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 1 &&
                                StaticIndexes.section == 3 &&
                                Score.synoScore < 30) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection4 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 1 &&
                                StaticIndexes.section == 4 &&
                                Score.synoScore < 40) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection5 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 2

                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 1 &&
                                Score.synoScore < 90) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection2 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 2 &&
                                Score.synoScore < 100) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection3 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 3 &&
                                Score.synoScore < 110) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection4 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 4 &&
                                Score.synoScore < 120) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection5 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 3

                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 1 &&
                                Score.synoScore < 170) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection2 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 2 &&
                                Score.synoScore < 180) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection3 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 3 &&
                                Score.synoScore < 190) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection4 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 4 &&
                                Score.synoScore < 200) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection5 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 4

                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 1 &&
                                Score.synoScore < 250) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection2 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 2 &&
                                Score.synoScore < 260) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection3 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 3 &&
                                Score.synoScore < 270) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection4 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 4 &&
                                Score.synoScore < 280) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection5 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 5

                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 1 &&
                                Score.synoScore < 330) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection2 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 2 &&
                                Score.synoScore < 340) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection3 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 3 &&
                                Score.synoScore < 350) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection4 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 4 &&
                                Score.synoScore < 360) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection5 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 6

                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 1 &&
                                Score.synoScore < 410) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection2 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 2 &&
                                Score.synoScore < 420) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection3 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 3 &&
                                Score.synoScore < 430) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection4 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 4 &&
                                Score.synoScore < 440) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection5 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }

                            // ********************************
                            // ********************************

                            if (StaticIndexes.step == 1) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step1()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (StaticIndexes.step == 2) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step2()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (StaticIndexes.step == 3) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step3()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (StaticIndexes.step == 4) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step4()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (StaticIndexes.step == 5) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step5()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (StaticIndexes.step == 6) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Step6()),
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
                  /*        for (int i = 1; i <= syno!.length; i++)
                    LettersButton(
                      title: "${syno![syno!.length - i]}",
                      onPressed: () {
                        setState(() {
                          normalInputColor = Color.fromARGB(255, 235, 236, 236);
                          _controller.text =
                              _controller.text + "${syno![syno!.length - i]}";
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
                            questions[StaticIndexes.index]["syno"][0];
                        _controller.text +=
                            questions[StaticIndexes.index]["syno"][1];
                        isHelpActivated = 1;
                        Score.synoHelp--;
                        function.setScore("syno_help", Score.synoHelp);
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
                  StaticIndexes.index++;
                  word = questions[StaticIndexes.index]['word'];
                  syno = questions[StaticIndexes.index]['syno'];

                  characters = syno?.split('');
                  characters?.shuffle(Random());
                  _controller.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SynoChallenge3()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("التالي", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
