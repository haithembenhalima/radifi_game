import 'package:flutter/material.dart';
import 'package:radifi_game/CategoriesGame.dart';
import 'package:radifi_game/HomePage.dart';
import 'package:radifi_game/about.dart';
import 'package:radifi_game/antonyms/challenges/anto_challenge1.dart';
import 'package:radifi_game/antonyms/challenges/anto_challenge1_1.dart';
import 'package:radifi_game/antonyms/challenges/anto_challenge2.dart';
import 'package:radifi_game/antonyms/challenges/anto_challenge3.dart';
import 'package:radifi_game/antonyms/challenges/anto_challenge4.dart';
import 'package:radifi_game/antonyms/step1.dart';
import 'package:radifi_game/antonyms/step2.dart';
import 'package:radifi_game/antonyms/step3.dart';
import 'package:radifi_game/antonyms/step4.dart';
import 'package:radifi_game/antonyms/step5.dart';
import 'package:radifi_game/antonyms/step6.dart';
import 'package:radifi_game/antonyms/steps.dart';
import 'package:radifi_game/plural/challenges/plural_challenge1.dart';
import 'package:radifi_game/plural/challenges/plural_challenge1_1.dart';
import 'package:radifi_game/plural/challenges/plural_challenge2.dart';
import 'package:radifi_game/plural/challenges/plural_challenge3.dart';
import 'package:radifi_game/plural/challenges/plural_challenge4.dart';
import 'package:radifi_game/plural/step1.dart';
import 'package:radifi_game/plural/step2.dart';
import 'package:radifi_game/plural/step3.dart';
import 'package:radifi_game/plural/step4.dart';
import 'package:radifi_game/plural/step5.dart';
import 'package:radifi_game/plural/step6.dart';
import 'package:radifi_game/plural/steps.dart';
import 'package:radifi_game/synonyms/challenges/syno_challenge1.dart';
import 'package:radifi_game/synonyms/challenges/syno_challenge1_1.dart';
import 'package:radifi_game/synonyms/challenges/syno_challenge2.dart';
import 'package:radifi_game/synonyms/challenges/syno_challenge3.dart';
import 'package:radifi_game/synonyms/challenges/syno_challenge4.dart';
import 'package:radifi_game/synonyms/step1.dart';
import 'package:radifi_game/synonyms/step2.dart';
import 'package:radifi_game/synonyms/step3.dart';
import 'package:radifi_game/synonyms/step4.dart';
import 'package:radifi_game/synonyms/step5.dart';
import 'package:radifi_game/synonyms/step6.dart';
import 'package:radifi_game/synonyms/steps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Almarai',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
      routes: {
        "homepage": (context) => HomePage(),
        "about": (context) => About(),
        "CategoriesGame": (context) => CategoriesGame(),
        "steps": (context) => Steps(),
        "step1": (context) => Step1(),
        "step2": (context) => Step2(),
        "step3": (context) => Step3(),
        "step4": (context) => Step4(),
        "step5": (context) => Step5(),
        "step6": (context) => Step6(),
        "syno_challenge1": (context) => SynoChallenge1(),
        "syno_challenge1_1": (context) => SynoChallenge1_1(),
        "syno_challenge2": (context) => SynoChallenge2(),
        "syno_challenge3": (context) => SynoChallenge3(),
        "syno_challenge4": (context) => SynoChallenge4(),
        // ***********
        "anto_steps": (context) => AntoSteps(),
        "anto_step1": (context) => AntoStep1(),
        "anto_step2": (context) => AntoStep2(),
        "anto_step3": (context) => AntoStep3(),
        "anto_step4": (context) => AntoStep4(),
        "anto_step5": (context) => AntoStep5(),
        "anto_step6": (context) => AntoStep6(),
        "anto_challenge1": (context) => AntoChallenge1(),
        "anto_challenge1_1": (context) => AntoChallenge1_1(),
        "anto_challenge2": (context) => AntoChallenge2(),
        "anto_challenge3": (context) => AntoChallenge3(),
        "anto_challenge4": (context) => AntoChallenge4(),

        // ***********
        "plural_steps": (context) => PluralSteps(),
        "plural_step1": (context) => PluralStep1(),
        "plural_step2": (context) => PluralStep2(),
        "plural_step3": (context) => PluralStep3(),
        "plural_step4": (context) => PluralStep4(),
        "plural_step5": (context) => PluralStep5(),
        "plural_step6": (context) => PluralStep6(),
        "plural_challenge1": (context) => PluralChallenge1(),
        "plural_challenge1_1": (context) => PluralChallenge1_1(),
        "plural_challenge2": (context) => PluralChallenge2(),
        "plural_challenge3": (context) => PluralChallenge3(),
        "plural_challenge4": (context) => PluralChallenge4(),
      },
    );
  }
}
