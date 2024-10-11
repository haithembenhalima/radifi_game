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

class PluralChallenge1 extends StatefulWidget {
  const PluralChallenge1({super.key});

  @override
  State<PluralChallenge1> createState() => _PluralChallenge1State();
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
PluralStep1Data data1 = PluralStep1Data();
PluralStep2Data data2 = PluralStep2Data();
PluralStep3Data data3 = PluralStep3Data();
PluralStep4Data data4 = PluralStep4Data();
PluralStep5Data data5 = PluralStep5Data();
PluralStep6Data data6 = PluralStep6Data();
ScoreFunctions function = ScoreFunctions();

class _PluralChallenge1State extends State<PluralChallenge1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHelpActivated = 0;
    normalInputColor = Color.fromARGB(255, 235, 236, 236);
    // step1
    if (pluralStaticIndexes.step == 1 && pluralStaticIndexes.section == 5) {
      questions = data1.Step1Section5;
      alphabet = data1.alphabet1;
    }

    if (pluralStaticIndexes.step == 1 && pluralStaticIndexes.section == 6) {
      questions = data1.Step1Section6;
      alphabet = data1.alphabet2;
    }

    if (pluralStaticIndexes.step == 1 && pluralStaticIndexes.section == 7) {
      questions = data1.Step1Section7;
      alphabet = data1.alphabet3;
    }
    if (pluralStaticIndexes.step == 2 && pluralStaticIndexes.section == 5) {
      questions = data2.Step2Section5;
      alphabet = data2.alphabet1;
    }

    if (pluralStaticIndexes.step == 2 && pluralStaticIndexes.section == 6) {
      questions = data2.Step2Section6;
      alphabet = data2.alphabet2;
    }

    if (pluralStaticIndexes.step == 2 && pluralStaticIndexes.section == 7) {
      questions = data2.Step2Section7;
      alphabet = data2.alphabet3;
    }
    if (pluralStaticIndexes.step == 3 && pluralStaticIndexes.section == 5) {
      questions = data3.Step3Section5;
      alphabet = data3.alphabet1;
    }

    if (pluralStaticIndexes.step == 3 && pluralStaticIndexes.section == 6) {
      questions = data3.Step3Section6;
      alphabet = data3.alphabet2;
    }

    if (pluralStaticIndexes.step == 3 && pluralStaticIndexes.section == 7) {
      questions = data3.Step3Section7;
      alphabet = data3.alphabet3;
    }

    if (pluralStaticIndexes.index == 0) word = questions[0]['word'];
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
            score: Score.pluralScore,
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
                        ":شكِّل جمع تكسير الكلمة ",
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
                                pluralStaticIndexes.section == 5 &&
                                Score.pluralScore < 50) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection6 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 1 &&
                                pluralStaticIndexes.section == 6 &&
                                Score.pluralScore < 60) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection7 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 1 &&
                                pluralStaticIndexes.section == 7 &&
                                Score.pluralScore < 70) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection8 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 1 &&
                                pluralStaticIndexes.section == 8 &&
                                Score.pluralScore < 80) {
                              Score.pluralScore += 10;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 2

                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 5 &&
                                Score.pluralScore < 130) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection6 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 6 &&
                                Score.pluralScore < 140) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection7 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 7 &&
                                Score.pluralScore < 150) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection8 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 2 &&
                                pluralStaticIndexes.section == 8 &&
                                Score.pluralScore < 160) {
                              Score.pluralScore += 10;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 3

                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 5 &&
                                Score.pluralScore < 210) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection6 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 6 &&
                                Score.pluralScore < 220) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection7 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 7 &&
                                Score.pluralScore < 230) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection8 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 3 &&
                                pluralStaticIndexes.section == 8 &&
                                Score.pluralScore < 240) {
                              Score.pluralScore += 10;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 4

                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 5 &&
                                Score.pluralScore < 290) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection6 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 6 &&
                                Score.pluralScore < 300) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection7 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 7 &&
                                Score.pluralScore < 310) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection8 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 4 &&
                                pluralStaticIndexes.section == 8 &&
                                Score.pluralScore < 320) {
                              Score.pluralScore += 10;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 5

                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 5 &&
                                Score.pluralScore < 370) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection6 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 6 &&
                                Score.pluralScore < 380) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection7 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 7 &&
                                Score.pluralScore < 390) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection7 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 5 &&
                                pluralStaticIndexes.section == 8 &&
                                Score.pluralScore < 400) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection8 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            // Score of the step 6

                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 5 &&
                                Score.pluralScore < 450) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection6 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 6 &&
                                Score.pluralScore < 460) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection7 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 7 &&
                                Score.pluralScore < 470) {
                              Score.pluralScore += 10;
                              pluralStaticIndexes.openSection8 = 1;
                              function.setScore(
                                  "plural_score", Score.pluralScore);
                            }
                            if (pluralStaticIndexes.step == 6 &&
                                pluralStaticIndexes.section == 8 &&
                                Score.pluralScore < 480) {
                              Score.pluralScore += 10;
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
                  _controller.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PluralChallenge1()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("التالي", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
