import 'package:flutter/material.dart';
import 'package:op_games/common/level/level_info.dart';
import 'package:op_games/quiz_section/OpMatchGame.dart';
import 'package:op_games/quiz_section/Quiz_page.dart';
import 'package:op_games/quiz_section/text_quiz.dart';
import 'package:op_games/quiz_section/mcq_quiz.dart';
import 'package:op_games/common/global.dart';
import 'package:op_games/quiz_section/mcq_img_quiz.dart';

class LevelSelectionContainer extends StatelessWidget {
  final int levelNum;
  final Widget nextPage;
  final Color startColor;
  final Color endColor;

  const LevelSelectionContainer({
    super.key,
    required this.levelNum,
    required this.nextPage,
    this.startColor = Colors.greenAccent,
    this.endColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {

    final LevelInfo currLevel = GlobalVariables.levels[levelNum];
    final String levelText= currLevel.levelNumber.toString();
    final bool isUnlocked = currLevel.isUnlocked;
    double screenWidth = MediaQuery.of(context).size.width;
    var heading = isUnlocked ? Text( levelText, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: screenWidth/30),)
        : Icon(Icons.lock, size: screenWidth/20, color: Colors.black38,);
    return InkWell(
      onTap: () {
        if (isUnlocked) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
        } else
          ()=> {};
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: screenWidth/12,
        height: screenWidth/12,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: isUnlocked ? [startColor, endColor] : [Colors.grey, Colors.black12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            heading,
          ],
        ),
      ),
    );
  }
}

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> isUnlockedList = [] ;
    double screenWidth = MediaQuery.of(context).size.width;
    for (int i = 0; i <= 11; i++){
      isUnlockedList.add(GlobalVariables.levels[i].isUnlocked);
    }
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

      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(flex: 1),
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        'LEVELS',
                        style: TextStyle(
                          fontSize: screenWidth/30,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.blue[700]!,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        'LEVELS',
                        style: TextStyle(
                          fontSize: screenWidth/30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children :[

                        LevelSelectionContainer(levelNum: 0, nextPage: OperatorsMatchingGamePage()),


                        LevelSelectionContainer(levelNum: 1,
                            nextPage: McqImgQuiz(opSign:'+', level: GlobalVariables.levels[1])),


                        LevelSelectionContainer(levelNum: 2,
                            nextPage: McqQuiz(opSign: '+', level: GlobalVariables.levels[2],)),


                        LevelSelectionContainer(levelNum: 3,
                            nextPage: TextQuiz(opSign:'+', level: GlobalVariables.levels[3])),


                        LevelSelectionContainer(levelNum: 4,
                            nextPage: McqImgQuiz(opSign:'-', level: GlobalVariables.levels[4])),


                        LevelSelectionContainer(levelNum: 5,
                           nextPage: McqQuiz(opSign: '-', level: GlobalVariables.levels[5],)),


                        LevelSelectionContainer(levelNum: 6,
                            nextPage: TextQuiz(opSign:'-', level: GlobalVariables.levels[6])),



                      ]
                  ),
                  Spacer(flex: 1),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children :[


                        LevelSelectionContainer(levelNum: 7,
                            nextPage: McqQuiz(opSign: 'x', level: GlobalVariables.levels[7],)),


                        LevelSelectionContainer(levelNum: 8, nextPage: TextQuiz(opSign: 'x', level: GlobalVariables.levels[8])),


                        LevelSelectionContainer(levelNum: 9, nextPage: McqQuiz(opSign: '÷', level: GlobalVariables.levels[9],)),


                        LevelSelectionContainer(levelNum: 10, nextPage: TextQuiz(opSign: '÷', level: GlobalVariables.levels[10])),


                        LevelSelectionContainer(levelNum: 11, nextPage: McqQuiz(opSign: 'mix', level: GlobalVariables.levels[11],)),


                        LevelSelectionContainer(levelNum: 12, nextPage: TextQuiz(opSign: 'mix', level: GlobalVariables.levels[12])),


                        LevelSelectionContainer(levelNum: 13, nextPage: TextQuiz(opSign: 'mix', level: GlobalVariables.levels[13])),


                      ]
                  ),
                  Spacer(flex: 2),
                ],
              )
          )
      ),

    );
  }


  Widget levelCard(BuildContext context, String level, IconData icon,
      Widget nextPage) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => nextPage));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          // Adjusted for consistent padding
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // Align text to the start
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center the icon and text horizontally
                children: [
                  Icon(icon, size: 50, color: Colors.white),
                  SizedBox(width: 10),
                  // Reduce space to bring text closer to the icon
                  Expanded( // Wrap Text in Expanded to prevent overflow
                    child: Text(
                      level,
                      style: TextStyle(fontSize: 34,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Playful',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}