import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:radifi_game/utils/functions.dart';
import '../../score.dart';
import '../data/plural_step2data.dart';
import '../data/plural_step4data.dart';
import '../data/plural_step5data.dart';
import '../data/plural_step6data.dart';
import '../data/plural_step1data.dart';
import '../data/plural_step3data.dart';
import '../statics_indexes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/buttons.dart';
import '../step1.dart';
import '../step2.dart';
import '../step3.dart';
import '../step4.dart';
import '../step5.dart';
import '../step6.dart';

class PluralChallenge3 extends StatefulWidget {
  const PluralChallenge3({super.key});

  @override
  State<PluralChallenge3> createState() => _PluralChallenge3State();
}

TextEditingController _controller = TextEditingController();

// Variables
Color normalInputColor = Color.fromARGB(255, 235, 236, 236);
Color errorInputColor = Color.fromARGB(255, 219, 23, 23);

List questions = [];
String? word;
String? plural;
PluralStep1Data data1 = PluralStep1Data();
PluralStep2Data data2 = PluralStep2Data();
PluralStep3Data data3 = PluralStep3Data();
PluralStep4Data data4 = PluralStep4Data();
PluralStep5Data data5 = PluralStep5Data();
PluralStep6Data data6 = PluralStep6Data();
List<String>? characters;
bool showHelpAlert = false;
int isHelpActivated = 0;
ScoreFunctions function = ScoreFunctions();

class _PluralChallenge3State extends State<PluralChallenge3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isHelpActivated = 0;
    normalInputColor = Color.fromARGB(255, 235, 236, 236);
    if (pluralStaticIndexes.step == 1 && pluralStaticIndexes.section == 2) {
      questions = data1.Step1Section2;
    }

    if (pluralStaticIndexes.step == 1 && pluralStaticIndexes.section == 4) {
      questions = data1.Step1Section4;
    }

    if (pluralStaticIndexes.step == 2 && pluralStaticIndexes.section == 2) {
      questions = data2.Step2Section2;
    }

    if (pluralStaticIndexes.step == 2 && pluralStaticIndexes.section == 4) {
      questions = data2.Step2Section4;
    }

    if (pluralStaticIndexes.step == 3 && pluralStaticIndexes.section == 2) {
      questions = data3.Step3Section2;
    }

    if (pluralStaticIndexes.step == 3 && pluralStaticIndexes.section == 4) {
      questions = data3.Step3Section4;
    }

    if (pluralStaticIndexes.step == 4 && pluralStaticIndexes.section == 2) {
      questions = data4.Step4Section2;
    }

    if (pluralStaticIndexes.step == 4 && pluralStaticIndexes.section == 4) {
      questions = data4.Step4Section4;
    }
    if (pluralStaticIndexes.step == 5 && pluralStaticIndexes.section == 2) {
      questions = data5.Step5Section2;
    }

    if (pluralStaticIndexes.step == 5 && pluralStaticIndexes.section == 4) {
      questions = data5.Step5Section4;
    }
    if (pluralStaticIndexes.step == 6 && pluralStaticIndexes.section == 2) {
      questions = data6.Step6Section2;
    }

    if (pluralStaticIndexes.step == 6 && pluralStaticIndexes.section == 4) {
      questions = data6.Step6Section4;
    }
    if (pluralStaticIndexes.index == 0) {
      word = questions[0]['word'];
      plural = questions[0]['plural'];
      characters = plural?.split('');
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
                        "رتّب الأحرف للحصول على جمع تكسير الكلمة:",
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
                  /*        for (int i = 1; i <= plural!.length; i++)
                    LettersButton(
                      title: "${plural![plural!.length - i]}",
                      onPressed: () {
                        setState(() {
                          normalInputColor = Color.fromARGB(255, 235, 236, 236);
                          _controller.text =
                              _controller.text + "${plural![plural!.length - i]}";
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
                            questions[pluralStaticIndexes.index]["plural"][0];
                        _controller.text +=
                            questions[pluralStaticIndexes.index]["plural"][1];
                        isHelpActivated = 1;
                        Score.pluralHelp--;
                        function.setScore("plural_help", Score.pluralHelp);
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
                  pluralStaticIndexes.index++;
                  word = questions[pluralStaticIndexes.index]['word'];
                  plural = questions[pluralStaticIndexes.index]['plural'];

                  characters = plural?.split('');
                  characters?.shuffle(Random());
                  _controller.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PluralChallenge3()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("التالي", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
