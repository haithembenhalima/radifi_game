import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/plural/statics_indexes.dart';
import 'package:radifi_game/score.dart';
import 'package:radifi_game/utils/functions.dart';
import '../../widgets/appbar.dart';
import '../../widgets/buttons.dart';
import '../data/plural_step2data.dart';
import '../data/plural_step4data.dart';
import '../data/plural_step5data.dart';
import '../data/plural_step6data.dart';
import '../data/plural_step1data.dart';
import '../data/plural_step3data.dart';
import '../step1.dart';
import '../step2.dart';
import '../step3.dart';
import '../step4.dart';
import '../step5.dart';
import '../step6.dart';

class PluralChallenge2 extends StatefulWidget {
  const PluralChallenge2({super.key});

  @override
  State<PluralChallenge2> createState() => _PluralChallenge2State();
}

TextEditingController _controller = TextEditingController();

// Variables
Color normalInputColor = Color.fromARGB(255, 235, 236, 236);
Color errorInputColor = Color.fromARGB(255, 219, 23, 23);

List questions = [];
List helpQuestions = [];
int isHelp = 0;
String? word;
int isHelpActivated = 0;
bool showHelpAlert = false;
PluralStep1Data data1 = PluralStep1Data();
PluralStep2Data data2 = PluralStep2Data();
PluralStep3Data data3 = PluralStep3Data();
PluralStep4Data data4 = PluralStep4Data();
PluralStep5Data data5 = PluralStep5Data();
PluralStep6Data data6 = PluralStep6Data();
ScoreFunctions function = ScoreFunctions();

class _PluralChallenge2State extends State<PluralChallenge2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHelpActivated = 0;
    normalInputColor = Color.fromARGB(255, 235, 236, 236);
    if (pluralStaticIndexes.step == 1 && pluralStaticIndexes.section == 1) {
      questions = data1.Step1Section1;
    }

    if (pluralStaticIndexes.step == 1 && pluralStaticIndexes.section == 3) {
      questions = data1.Step1Section3;
    }

    if (pluralStaticIndexes.step == 2 && pluralStaticIndexes.section == 1) {
      questions = data2.Step2Section1;
    }

    if (pluralStaticIndexes.step == 2 && pluralStaticIndexes.section == 3) {
      questions = data2.Step2Section3;
    }

    if (pluralStaticIndexes.step == 3 && pluralStaticIndexes.section == 1) {
      questions = data3.Step3Section1;
    }

    if (pluralStaticIndexes.step == 3 && pluralStaticIndexes.section == 3) {
      questions = data3.Step3Section3;
    }

    if (pluralStaticIndexes.step == 4 && pluralStaticIndexes.section == 1) {
      questions = data4.Step4Section1;
    }

    if (pluralStaticIndexes.step == 4 && pluralStaticIndexes.section == 3) {
      questions = data4.Step4Section3;
    }
    if (pluralStaticIndexes.step == 5 && pluralStaticIndexes.section == 1) {
      questions = data5.Step5Section1;
    }
    if (pluralStaticIndexes.step == 5 && pluralStaticIndexes.section == 3) {
      questions = data5.Step5Section3;
    }
    if (pluralStaticIndexes.step == 6 && pluralStaticIndexes.section == 1) {
      questions = data6.Step6Section1;
    }
    if (pluralStaticIndexes.step == 6 && pluralStaticIndexes.section == 3) {
      questions = data6.Step6Section3;
    }



    if (pluralStaticIndexes.index == 0) word = questions[0]['word'];
    isHelp = 0;
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
            score: Score.pluralScore,
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
                      "${Score.pluralHelp}",
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
                        ":ماهو جمع تكسير الكلمة ",
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
                      suffixIcon: InkWell(
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
                              questions[pluralStaticIndexes.index]["plural"]) {
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

                          if (pluralStaticIndexes.index == 5) {
                            _controller.clear();
                            pluralStaticIndexes.index = 0;

                            // ********************************
                            // ********************************
                            // Increment the score value
                            // Score of the step 1

                            if (pluralStaticIndexes.step == 1 &&
                                pluralStaticIndexes.section == 1 &&
                                Score.pluralScore < 10) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection2 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 1 &&
                                pluralStaticIndexes.section == 2 &&
                                Score.pluralScore < 20) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection3 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 1 &&
                                pluralStaticIndexes.section == 3 &&
                                Score.pluralScore < 30) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection4 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 1 &&
                                pluralStaticIndexes.section == 4 &&
                                Score.pluralScore < 40) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection5 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 2

                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 1 &&
                                Score.pluralScore < 90) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection2 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 2 &&
                                Score.pluralScore < 100) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection3 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 3 &&
                                Score.pluralScore < 110) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection4 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 4 &&
                                Score.pluralScore < 120) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection5 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 3

                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 1 &&
                                Score.pluralScore < 170) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection2 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 2 &&
                                Score.pluralScore < 180) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection3 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 3 &&
                                Score.pluralScore < 190) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection4 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 4 &&
                                Score.pluralScore < 200) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection5 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 4

                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 1 &&
                                Score.pluralScore < 250) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection2 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 2 &&
                                Score.pluralScore < 260) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection3 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 3 &&
                                Score.pluralScore < 270) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection4 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 4 &&
                                Score.pluralScore < 280) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection5 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 5

                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 1 &&
                                Score.pluralScore < 330) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection2 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 2 &&
                                Score.pluralScore < 340) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection3 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 3 &&
                                Score.pluralScore < 350) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection4 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 4 &&
                                Score.pluralScore < 360) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection5 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 6

                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 1 &&
                                Score.pluralScore < 410) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection2 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 2 &&
                                Score.pluralScore < 420) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection3 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 3 &&
                                Score.pluralScore < 430) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection4 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 4 &&
                                Score.pluralScore < 440) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection5 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }

                            // ********************************
                            // ********************************

                            // ********************************
                            // ********************************

                            if (pluralStaticIndexes.step == 1) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PluralStep1()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (pluralStaticIndexes.step == 2) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PluralStep2()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (pluralStaticIndexes.step == 3) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PluralStep3()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (pluralStaticIndexes.step == 4) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PluralStep4()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (pluralStaticIndexes.step == 5) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PluralStep5()),
                                (Route<dynamic> route) => false,
                              );
                            }
                            if (pluralStaticIndexes.step == 6) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PluralStep6()),
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
                  if (pluralStaticIndexes.index % 2 == 0 && isHelp == 0)
                    for (int i = 0; i < 6; i++)
                      LettersButton(
                        title: "${questions[i]["plural"]}",
                        onPressed: () {
                          setState(() {
                            normalInputColor =
                                Color.fromARGB(255, 235, 236, 236);
                            _controller.text = "${questions[i]["plural"]}";
                          });
                        },
                      ),
                  if (pluralStaticIndexes.index % 2 != 0 && isHelp == 0)
                    for (int i = 1; i <= 6; i++)
                      LettersButton(
                        title: "${questions[6 - i]["plural"]}",
                        onPressed: () {
                          setState(() {
                            normalInputColor =
                                Color.fromARGB(255, 235, 236, 236);
                            _controller.text = "${questions[6 - i]["plural"]}";
                          });
                        },
                      ),
                  if (pluralStaticIndexes.index % 2 != 0 && isHelp == 1)
                    for (int i = 1; i <= 3; i++)
                      LettersButton(
                        title: "${helpQuestions[3 - i]["plural"]}",
                        onPressed: () {
                          setState(() {
                            normalInputColor =
                                Color.fromARGB(255, 235, 236, 236);
                            _controller.text =
                                "${helpQuestions[3 - i]["plural"]}";
                          });
                        },
                      ),
                  if (pluralStaticIndexes.index % 2 == 0 && isHelp == 1)
                    for (int i = 1; i <= 3; i++)
                      LettersButton(
                        title: "${helpQuestions[3 - i]["plural"]}",
                        onPressed: () {
                          setState(() {
                            normalInputColor =
                                Color.fromARGB(255, 235, 236, 236);
                            _controller.text =
                                "${helpQuestions[3 - i]["plural"]}";
                          });
                        },
                      ),
                ],
              ),
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
                      isHelp = 1;
                      if (isHelp == 1 &&
                          isHelpActivated == 0 &&
                          Score.pluralHelp > 0) {
                        _controller.clear();
                        if (pluralStaticIndexes.index == 0) {
                          helpQuestions.clear();
                          helpQuestions.add(questions[0]);
                          helpQuestions.add(questions[1]);
                          helpQuestions.add(questions[2]);
                        }
                        if (pluralStaticIndexes.index == 1) {
                          helpQuestions.clear();
                          helpQuestions.add(questions[0]);
                          helpQuestions.add(questions[1]);
                          helpQuestions.add(questions[2]);
                        }
                        if (pluralStaticIndexes.index == 2) {
                          helpQuestions.clear();
                          helpQuestions.add(questions[0]);
                          helpQuestions.add(questions[1]);
                          helpQuestions.add(questions[2]);
                        }
                        if (pluralStaticIndexes.index == 3) {
                          helpQuestions.clear();
                          helpQuestions.add(questions[3]);
                          helpQuestions.add(questions[1]);
                          helpQuestions.add(questions[2]);
                        }
                        if (pluralStaticIndexes.index == 4) {
                          helpQuestions.clear();
                          helpQuestions.add(questions[0]);
                          helpQuestions.add(questions[4]);
                          helpQuestions.add(questions[2]);
                        }
                        if (pluralStaticIndexes.index == 5) {
                          helpQuestions.clear();
                          helpQuestions.add(questions[5]);
                          helpQuestions.add(questions[1]);
                          helpQuestions.add(questions[4]);
                        }
                        isHelpActivated = 1;
                        Score.pluralHelp--;
                        function.setScore("plural_help", Score.pluralHelp);
                        showHelpAlert = false;
                      } else {
                        showHelpAlert = false;
                        isHelp = 0;
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
                  pluralStaticIndexes.index++;
                  word = questions[pluralStaticIndexes.index]['word'];
                  _controller.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PluralChallenge2()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("التالي", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
