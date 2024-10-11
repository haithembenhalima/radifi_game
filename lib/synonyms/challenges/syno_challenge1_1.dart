import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class SynoChallenge1_1 extends StatefulWidget {
  const SynoChallenge1_1({super.key});

  @override
  State<SynoChallenge1_1> createState() => _SynoChallenge1_1State();
}

TextEditingController _controller = TextEditingController();
// Variables
Color normalInputColor = Color.fromARGB(255, 235, 236, 236);
Color errorInputColor = Color.fromARGB(255, 219, 23, 23);

List questions = [];
String? word;
bool showHelpAlert = false;
int isHelpActivated = 0;
List alphabet = [];
SynoStep1Data data1 = SynoStep1Data();
SynoStep2Data data2 = SynoStep2Data();
SynoStep3Data data3 = SynoStep3Data();
SynoStep4Data data4 = SynoStep4Data();
SynoStep5Data data5 = SynoStep5Data();
SynoStep6Data data6 = SynoStep6Data();
ScoreFunctions function = ScoreFunctions();

class _SynoChallenge1_1State extends State<SynoChallenge1_1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHelpActivated = 0;
    normalInputColor = Color.fromARGB(255, 235, 236, 236);
    // step1
    if (StaticIndexes.step == 4 && StaticIndexes.section == 5) {
      questions = data4.Step4Section5;
      alphabet = data4.alphabet1;
    }
    if (StaticIndexes.step == 4 && StaticIndexes.section == 6) {
      questions = data4.Step4Section6;
      alphabet = data4.alphabet2;
    }

    if (StaticIndexes.step == 4 && StaticIndexes.section == 7) {
      questions = data4.Step4Section7;
      alphabet = data4.alphabet3;
    }
    if (StaticIndexes.step == 5 && StaticIndexes.section == 5) {
      questions = data5.Step5Section5;
      alphabet = data5.alphabet1;
    }

    if (StaticIndexes.step == 5 && StaticIndexes.section == 6) {
      questions = data5.Step5Section6;
      alphabet = data5.alphabet2;
    }

    if (StaticIndexes.step == 5 && StaticIndexes.section == 7) {
      questions = data5.Step5Section7;
      alphabet = data5.alphabet3;
    }
    if (StaticIndexes.step == 6 && StaticIndexes.section == 5) {
      questions = data6.Step6Section5;
      alphabet = data6.alphabet1;
    }

    if (StaticIndexes.step == 6 && StaticIndexes.section == 6) {
      questions = data6.Step6Section6;
      alphabet = data6.alphabet2;
    }

    if (StaticIndexes.step == 6 && StaticIndexes.section == 7) {
      questions = data6.Step6Section7;
      alphabet = data6.alphabet3;
    }
    if (StaticIndexes.index == 0) word = questions[0]['word'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("images/pic2-2.png"),
                    fit: BoxFit.cover)),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 150.0),
          ),
          //******************** */
          /********************* */
          appBarWidgetChallenge(
            score: Score.synoScore,
          ),
          /******************* */
          //******************* */
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
                        ":شكِّل مرادف الكلمة ",
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
                          color: const Color.fromARGB(255, 255, 99, 99),
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
              Wrap(
                spacing: 8,
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
                                StaticIndexes.section == 5 &&
                                Score.synoScore < 50) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection6 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 1 &&
                                StaticIndexes.section == 6 &&
                                Score.synoScore < 60) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection7 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 1 &&
                                StaticIndexes.section == 7 &&
                                Score.synoScore < 70) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection8 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 1 &&
                                StaticIndexes.section == 8 &&
                                Score.synoScore < 80) {
                              Score.synoScore += 10;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 2

                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 5 &&
                                Score.synoScore < 130) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection6 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 6 &&
                                Score.synoScore < 140) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection7 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 7 &&
                                Score.synoScore < 150) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection8 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 2 &&
                                StaticIndexes.section == 8 &&
                                Score.synoScore < 160) {
                              Score.synoScore += 10;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 3

                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 5 &&
                                Score.synoScore < 210) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection6 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 6 &&
                                Score.synoScore < 220) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection7 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 7 &&
                                Score.synoScore < 230) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection8 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 3 &&
                                StaticIndexes.section == 8 &&
                                Score.synoScore < 240) {
                              Score.synoScore += 10;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 4

                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 5 &&
                                Score.synoScore < 290) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection6 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 6 &&
                                Score.synoScore < 300) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection7 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 7 &&
                                Score.synoScore < 310) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection8 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 4 &&
                                StaticIndexes.section == 8 &&
                                Score.synoScore < 320) {
                              Score.synoScore += 10;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 5

                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 5 &&
                                Score.synoScore < 370) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection6 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 6 &&
                                Score.synoScore < 380) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection7 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 7 &&
                                Score.synoScore < 390) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection7 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 5 &&
                                StaticIndexes.section == 8 &&
                                Score.synoScore < 400) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection8 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            // Score of the step 6

                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 5 &&
                                Score.synoScore < 450) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection6 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 6 &&
                                Score.synoScore < 460) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection7 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 7 &&
                                Score.synoScore < 470) {
                              Score.synoScore += 10;
                              StaticIndexes.openSection8 = 1;
                              function.setScore("syno_score", Score.synoScore);
                            }
                            if (StaticIndexes.step == 6 &&
                                StaticIndexes.section == 8 &&
                                Score.synoScore < 480) {
                              Score.synoScore += 10;
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
                  for (int i = 0; i < alphabet.length; i++)
                    LettersButton(
                      title: "${alphabet[i]}",
                      onPressed: () {
                        setState(() {
                          normalInputColor = Color.fromARGB(255, 235, 236, 236);
                          if (alphabet[i] == 'هـ') {
                            _controller.text += 'ه';
                          } else {
                            _controller.text =
                                _controller.text + "${alphabet[i]}";
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
                  _controller.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SynoChallenge1_1()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("التالي", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
