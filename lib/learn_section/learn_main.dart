import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:op_games/common/image.dart';
import 'package:op_games/learn_section/operator.dart';
import 'package:op_games/common/operator_data/op_data.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                Text('Operator List',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: screenWidth/15),
                ),
                Spacer(flex: 1),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children :[
                      Spacer(flex: 2),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage(operatorData:data['+']! ,)));
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: screenWidth/7,
                          height: screenWidth/7,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('+',
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: screenWidth/10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage(operatorData:data['-']! ,)));
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: screenWidth/7,
                          height: screenWidth/7,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('-',
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: screenWidth/10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage(operatorData:data['x']! ,)));
                          },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: screenWidth/7,
                          height: screenWidth/7,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('X',
                                style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: screenWidth/13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OperatorPage(operatorData:data['÷']! ,)));
                          },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: screenWidth/7,
                          height: screenWidth/7,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('÷',
                                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: screenWidth/10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                    ]
                ),
                Spacer(flex: 2),
              ],
            )
          )
      ),

    );
  }
}