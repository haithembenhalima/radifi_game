import 'package:flutter/material.dart';
import 'package:radifi_game/score.dart';
import 'package:radifi_game/utils/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

ScoreFunctions func = ScoreFunctions();

class _HomePageState extends State<HomePage> {
  ScoreFunctions func = ScoreFunctions();
  var syno_score;
  var syno_help;
  var anto_help;
  var anto_score;
  var plural_help;
  var plural_score;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("images/pic2.png"),
                    fit: BoxFit.cover)),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 150.0),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    shadows: <Shadow>[
                      Shadow(color: Colors.black, blurRadius: 10.0)
                    ],
                  ),
                  onPressed: () {
                    _settingAlert(context);
                  },
                  iconSize: 35,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.info,
                    shadows: <Shadow>[
                      Shadow(color: Colors.black, blurRadius: 10.0)
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'about');
                  },
                  iconSize: 35,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("images/radifi_logo.png")),
                ElevatedButton.icon(
                  icon: Text(
                    'ابدأ الآن',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  label: Icon(
                    Icons.arrow_back,
                    size: 45,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 235, 236, 236),
                    padding: const EdgeInsets.all(10),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      // Change your radius here
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    syno_score = await func.getScore("syno_score");
                    syno_help = await func.getScore("syno_help");
                    anto_score = await func.getScore("anto_score");
                    anto_help = await func.getScore("anto_help");
                    plural_score = await func.getScore("plural_score");
                    plural_help = await func.getScore("plural_help");
                    if (syno_score == null) {
                      Score.synoScore = 0;
                      Score.synoHelp = 3;
                      Navigator.of(context).pushNamed("CategoriesGame");
                    } else {
                      Score.synoScore = syno_score;
                      Score.synoHelp = syno_help;
                      Navigator.of(context).pushNamed("CategoriesGame");
                    }
                    // **********************
                    if (anto_score == null) {
                      Score.antoScore = 0;
                      Score.antoHelp = 3;
                      Navigator.of(context).pushNamed("CategoriesGame");
                    } else {
                      Score.antoScore = anto_score;
                      Score.antoHelp = anto_help;
                      Navigator.of(context).pushNamed("CategoriesGame");
                    }
                    // **********************
                    if (plural_score == null) {
                      Score.pluralScore = 0;
                      Score.pluralHelp = 3;
                      Navigator.of(context).pushNamed("CategoriesGame");
                    } else {
                      Score.pluralScore = plural_score;
                     // Score.pluralHelp = plural_help;
                      Navigator.of(context).pushNamed("CategoriesGame");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Alert Dialog for quit the quizz
_settingAlert(context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الإعدادات",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.settings,
                      size: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  title: Text(
                    "مسح البيانات",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.refresh,
                    size: 30,
                  ),
                  onTap: () {
                    _confirmDeleteData(context);
                  },
                ),
                ListTile(
                  title: Text(
                    "التحديثات",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.download,
                    size: 30,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 4, 151, 80))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    const Text("إخفاء", style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}

// ** confirmation alert for delete the data from the app
_confirmDeleteData(context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.start,
            title: Text(
              "هل تريد فعلا حذف البيانات ؟",
              textDirection: TextDirection.rtl,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Score.synoScore = 0;
                  Score.synoHelp = 3;
                  Score.antoScore = 0;
                  Score.antoHelp = 3;
                  Score.antoScore = 0;
                  Score.antoHelp = 3;
                  func.setScore("syno_score", Score.synoScore);
                  func.setScore("syno_help", Score.synoHelp);
                  func.setScore("anto_score", Score.antoScore);
                  func.setScore("anto_help", Score.antoHelp);
                  func.setScore("plural_score", Score.pluralScore);
                  func.setScore("plural_help", Score.pluralHelp);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child:
                    const Text("نعم", style: TextStyle(color: Colors.purple)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'لا'),
                child: const Text(
                  "لا",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ));
}
