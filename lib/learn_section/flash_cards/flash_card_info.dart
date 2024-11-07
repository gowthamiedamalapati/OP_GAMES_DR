import 'package:flutter/material.dart';
import 'package:op_games/common/picture_form.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:op_games/common/comm_functions.dart';
import 'dart:math' as math;

class FlashCardInfo extends StatelessWidget {
  final int _f;
  final int _s;
  final String _sign;
  final double _size = 30;
  final double fontSize;
  
  const FlashCardInfo(this._sign, this._f, this._s, {Key? key, required this.fontSize}) : super(key: key);
  
  double get safeFontSize => math.min(fontSize, 20.0);
  
  @override
  Widget build(BuildContext context) {
    int res = get_op_result(_sign, _f, _s);
    int rem = (_sign == '÷') ? _f % _s : 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _f.toString() + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              _sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              _s.toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              '  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              res.toString(),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
          ],
        ),
        if (_sign == '÷')
          Text(
            "remainder = " + rem.toString(),
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: safeFontSize,
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              NumberToWordsEnglish.convert(_f) + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              _sign + "  ",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              NumberToWordsEnglish.convert(_s),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              '  =  ',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
            Text(
              NumberToWordsEnglish.convert(res),
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: safeFontSize),
            ),
          ],
        ),
        if (_sign == '÷')
          Text(
            "remainder = " + rem.toString(),
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: safeFontSize,
            ),
          ),
      ],
    );
  }
}
