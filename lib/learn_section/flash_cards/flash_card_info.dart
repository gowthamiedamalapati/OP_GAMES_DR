import 'package:flutter/material.dart';
import 'package:op_games/common/picture_form.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:op_games/common/comm_functions.dart';
class FlashCardInfo extends StatelessWidget {
  final int _f;
  final int _s;
  final String _sign;
  final double _size = 30;
  const FlashCardInfo(this._sign, this._f, this._s, {super.key});


  @override
  Widget build(BuildContext context) {
    int res = get_op_result(_sign,_f,_s);
    int rem = (_sign == '÷' ) ? _f % _s : 0 ;

    return Column(
      children: [

        Row(
          children: [

            Text(_f.toString() + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(_sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(_s.toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text('  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(res.toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            _sign == '÷' ? Text(",  ",
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50))
                : Text(''),
            _sign == '÷' ? Text("remainder = " + rem.toString(),
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50))
                    : Text(''),

          ],
        ),
        Row(
          children: [

            Text(NumberToWordsEnglish.convert(_f) + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(_sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(NumberToWordsEnglish.convert(_s),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text('  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(NumberToWordsEnglish.convert(res),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            _sign == '÷' ? Text(",  ",
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50))
                : Text(''),
            _sign == '÷' ? Text("remainder = " + NumberToWordsEnglish.convert(rem),
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50))
                : Text(''),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            PictureForm(num:5,size:30),
            Text("  " + _sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            PictureForm(num:5,size:30),
            Text('  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Column(
              children: [
                for (int i = 0; i < (res / 15).ceil(); i++)
                  PictureForm(
                    num: res > (i + 1) * 15 ? 15 : res - i * 15,
                    size: 30,
                  ),

              ],
            ),
            _sign == '÷' ? Text(",  ",
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50))
                : Text(''),
            _sign == '÷' ? Text("remainder = " + rem.toString(),
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 50))
                : Text(''),

          ],
        ),
      ]

    );
  }
}


// ImageBanner("assets/orange.png", 40, 40),