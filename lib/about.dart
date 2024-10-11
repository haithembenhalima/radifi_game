import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  NavigateByUrl(String link) async {
    final Uri _url = Uri.parse(link);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        // Start body

        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ListTile(
                title: Text(
                  "حول التطبيق",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      fontSize: 23),
                ),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue[900],
                  size: 28,
                ),
              ),
              Divider(),
                            ListTile(
                  title: Text('''
لعبة الرديف تساعد في اكتساب المفردات الجديدة بأسلوب شيّق (التعلّم باللعب)، وتختص بتعلم المترادفات والأضداد في ألعاب مسلية، و تعلمك أيضا جموع التكسير العربية، وبناء القوافي لاستعمالها في الشعر.
اللعبة تعليمية، غرضها تحسين المحتوى العربي، وتضاف إلى سلسلة تطبيقاتنا للغة العربية مثل تطبيق الرديف للمترادفات والأضداد وجموع التكسير والقوافي وتطبيق قطرب لتصريف الأفعال. وستليه تطبيقات أخرى.
                         '''),),
                         Divider(),
              ListTile(
                title: Text(
                  "المطورون",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      fontSize: 23),
                ),
                leading: Icon(
                  Icons.developer_mode,
                  color: Colors.blue[900],
                  size: 28,
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              ListTile(
                  title: Text("طه زروقي - Taha zerrouki"),
                  subtitle: Text(
                      "الدكتور طه زروقي، من الجزائر \nأستاذ علوم الحاسوب بجامعة البويرة، الجزائر مستشار في علوم الحاسوب باحث في المعالجة الآلية للغة العربية  مهتم بالمصادر المفتوحة و البرامج الحرة"),
                  leading: Image.asset("images/taha.jpg")),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          NavigateByUrl("https://github.com/linuxscout");
                        },
                        icon: Icon(
                          FontAwesomeIcons.github,
                          size: 18,
                        )),
                    IconButton(
                        onPressed: () {
                          NavigateByUrl("https://linkedin.com/in/tahazerrouki");
                        },
                        icon: Icon(
                          FontAwesomeIcons.linkedin,
                          size: 18,
                        )),
                    IconButton(
                        onPressed: () {
                          NavigateByUrl("http://tahadz.com");
                        },
                        icon: Icon(
                          FontAwesomeIcons.link,
                          size: 18,
                        )),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                  title: Text("هيثم بن حليمة - Haithem benhalima"),
                  subtitle: Text(
                      "طالب بكلية علوم الحاسوب بجامعة البويرة، الجزائر \n مطور تطبيقات متعددة المنصات \n مصمم و مطور مواقع الويب \n مهتم    بالذكاء الإصطناعي و أنترنت الأشياء"),
                  leading: Image.asset("images/haithem.jpg")),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          NavigateByUrl("https://github.com/haithembenhalima");
                        },
                        icon: Icon(
                          FontAwesomeIcons.github,
                          size: 18,
                        )),
                    IconButton(
                        onPressed: () {
                          NavigateByUrl(
                              "https://linkedin.com/in/haithem-benhalima-64899b253");
                        },
                        icon: Icon(
                          FontAwesomeIcons.linkedin,
                          size: 18,
                        )),
                    IconButton(
                        onPressed: () {
                          NavigateByUrl(
                              "https://www.facebook.com/haithem.benhalima.3/");
                        },
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          size: 18,
                        )),
                    IconButton(
                        onPressed: () {
                          NavigateByUrl("https://t.me/haithem_benhalima");
                        },
                        icon: Icon(
                          FontAwesomeIcons.telegram,
                          size: 18,
                        )),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ));
  }
}
