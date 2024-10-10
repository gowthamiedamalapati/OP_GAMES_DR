import 'package:flutter/material.dart';
// import 'package:op_games/learn_section/operator.dart';
import 'package:op_games/common/widgets/answer_card.dart';
// import 'package:op_games/widgets/next_button.dart';
import 'package:op_games/common/question_data/mcq_question.dart';
import 'package:op_games/common/question_data/gen_mcq_questions.dart';
import 'package:flutter_tts/flutter_tts.dart';
import "package:op_games/common/translate/translate.dart";
import 'package:op_games/common/global.dart';
import 'dart:developer';
class PracticeScreen extends StatefulWidget {
  final String opSign;
  const PracticeScreen({Key? key,required this.opSign}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}


class _PracticeScreenState extends State<PracticeScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  late double screenWidth = MediaQuery.of(context).size.width;
  late List<McqQuestion> questions;
  FlutterTts flutterTts = FlutterTts();
  int currentLanguage= 0;
  late Map<String, dynamic> pageLangData;
  late List<String> quesHeading;
  late List<String> LangKeys;

  @override
  void initState() {
    super.initState();
    questions = getMcqQuestions(widget.opSign);
    pageLangData = getMCQLanguageData(GlobalVariables.priLang, GlobalVariables.secLang);
    quesHeading = [pageLangData["ques_heading"]["pri_lang"], pageLangData["ques_heading"]["sec_lang"]];
    LangKeys = [getSpeakLangKey(GlobalVariables.priLang), getSpeakLangKey(GlobalVariables.secLang)];
    log("$quesHeading");
  }

  Future<void> ReadOut(String text) async {
    await flutterTts.setLanguage(LangKeys[currentLanguage]);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  void pickAnswer(int value){
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex){

    }
    setState(() {});
  }

  void changeLang(){
    setState(() {
      currentLanguage = currentLanguage == 0 ? 1 : 0;
    });
  }

  void gotoNextQuestion(){
    if (questionIndex < questions.length - 1){
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length-1;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          foregroundColor: Colors.black,
          backgroundColor: Colors.lightBlue,
          shape: CircleBorder(),

          child: const Icon(Icons.arrow_back_ios),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:
      Padding(
        padding: const EdgeInsets.fromLTRB(50,100, 50,50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Container(
              height: 100,
              width: 1500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    quesHeading[currentLanguage],
                    style: const TextStyle(
                      // backgroundColor: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    question.question[currentLanguage],
                    style: const TextStyle(
                      // backgroundColor: Colors.grey,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? ()=> pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index][currentLanguage],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
            // Next button
            SizedBox(height: 10,),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    ReadOut('$quesHeading[currentLanguage], ${question.question}');
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.lightGreen,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.volume_up,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 170,),
                InkWell(
                  onTap: () {
                    if (questionIndex == questions.length-1 && selectedAnswerIndex != null) {
                      Navigator.pop(context);

                    } else if (selectedAnswerIndex != null){
                      gotoNextQuestion();
                    }
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: screenWidth - screenWidth/2,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedAnswerIndex != null ? Colors.lightBlue : Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text( 'Next' ,
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 170,),
                InkWell(
                  onTap: () {
                    changeLang();
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.lightGreen,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.translate,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          ),
        ),
      )
    );
  }
}