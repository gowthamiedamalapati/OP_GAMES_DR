import 'package:op_games/common/random_num_gen.dart';
import 'package:op_games/common/translate/translate.dart';
import 'package:op_games/common/global.dart';
import 'package:spelling_number/spelling_number.dart';

Map<String, Map<String, dynamic>> data = {
  '+': {
    'op_sign': '+',
    'op_name': 'PLUS',
  },
  '-': {
    'op_sign': '-',
    'op_name': 'MINUS',
  },
  'x': {
    'op_sign': 'x',
    'op_name': 'MULTIPLICATION',
  },
  '÷': {
    'op_sign': '÷',
    'op_name': 'DIVISION',
  },
};

List<Map<String, dynamic>> get_op_data(String sign){
  Map<String, dynamic> flashcardLangData= getFlashCardLanguageData(GlobalVariables.priLang, GlobalVariables.secLang);
  List<String> LangKey = [getNumToWordLangKey(GlobalVariables.priLang),getNumToWordLangKey(GlobalVariables.secLang) ];
  // log('data:$flashcardLangData');
  List<List<int>> data = [
    getRandomNumbersWithLimit(10, 10),
    getRandomNumbersWithLimit(10, 10),
    getRandomNumbersWithLimit(10, 10),
  ];
  List<Map<String, dynamic>>  result ;
  Map<String, List<Map<String, dynamic>>> flashCards  = {
     '+' : [
              {
                "op_name": [flashcardLangData["+"]["op_name"]["pri_lang"], flashcardLangData["+"]["op_name"]["sec_lang"]],
                "op_sign": "+",
                "op_def": [flashcardLangData["+"]["op_def"]["pri_lang"], flashcardLangData["+"]["op_def"]["sec_lang"]],
                'fst_num': 5,
                'snd_num': 6,
              },
              {
                "op_name": [data[0][0].toString() + " + " + data[0][1].toString(), data[0][0].toString() + " + " + data[0][1].toString()],
                "op_sign": "+",
                "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
                'fst_num': data[0][0],
                'snd_num': data[0][1],
              },
              {
                "op_name": [SpellingNumber(lang: LangKey[0]).convert(data[1][0])+ " + " + SpellingNumber(lang: LangKey[0]).convert(data[1][1]),
                  SpellingNumber(lang: LangKey[1]).convert(data[1][0])+ " + " + SpellingNumber(lang: LangKey[1]).convert(data[1][1]),],
                "op_sign": "+",
                "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
                'fst_num': data[1][0],
                'snd_num': data[1][1],
              },
     ],
     '-': [
       {
         "op_name": [flashcardLangData["-"]["op_name"]["pri_lang"], flashcardLangData["-"]["op_name"]["sec_lang"]],
         "op_sign": "-",
         "op_def": [flashcardLangData["-"]["op_def"]["pri_lang"], flashcardLangData["-"]["op_def"]["sec_lang"]],
         'fst_num': 10,
         'snd_num': 5,
       },
       {
         "op_name": [data[0][0].toString() + " - " + data[0][1].toString(), data[0][0].toString() + " - " + data[0][1].toString()],
         "op_sign": "-",
         "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
         'fst_num': data[0][0],
         'snd_num': data[0][1],
       },
       {
         "op_name": [SpellingNumber(lang: LangKey[0]).convert(data[1][0])+ " - " + SpellingNumber(lang: LangKey[0]).convert(data[1][1]),
           SpellingNumber(lang: LangKey[1]).convert(data[1][0])+ " - " + SpellingNumber(lang: LangKey[1]).convert(data[1][1]),],
         "op_sign": "-",
         "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
         'fst_num': data[1][0],
         'snd_num': data[1][1],
       },
     ],
     'x': [
       {
         "op_name": [flashcardLangData["x"]["op_name"]["pri_lang"], flashcardLangData["x"]["op_name"]["sec_lang"]],
         "op_sign": "x",
         "op_def": [flashcardLangData["x"]["op_def"]["pri_lang"], flashcardLangData["x"]["op_def"]["sec_lang"]],
         'fst_num': 5,
         'snd_num': 6,
       },
       {
         "op_name": [data[0][0].toString() + " x " + data[0][1].toString(), data[0][0].toString() + " x " + data[0][1].toString()],
         "op_sign": "x",
         "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
         'fst_num': data[0][0],
         'snd_num': data[0][1],
       },
       {
         "op_name": [SpellingNumber(lang: LangKey[0]).convert(data[1][0])+ " x " + SpellingNumber(lang: LangKey[0]).convert(data[1][1]),
           SpellingNumber(lang: LangKey[1]).convert(data[1][0])+ " x " + SpellingNumber(lang: LangKey[1]).convert(data[1][1]),],
         "op_sign": "x",
         "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
         'fst_num': data[1][0],
         'snd_num': data[1][1],
       },
     ],
     '÷': [
       {
         "op_name": [flashcardLangData["÷"]["op_name"]["pri_lang"], flashcardLangData["÷"]["op_name"]["sec_lang"]],
         "op_sign": "÷",
         "op_def": [flashcardLangData["÷"]["op_def"]["pri_lang"], flashcardLangData["÷"]["op_def"]["sec_lang"]],
         'fst_num': 20,
         'snd_num': 5,
       },
       {
         "op_name": [data[0][0].toString() + " ÷ " + data[0][1].toString(), data[0][0].toString() + " ÷ " + data[0][1].toString()],
         "op_sign": "÷",
         "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
         'fst_num': data[0][0],
         'snd_num': data[0][1],
       },
       {
         "op_name": [SpellingNumber(lang: LangKey[0]).convert(data[1][0])+ " ÷ " + SpellingNumber(lang: LangKey[0]).convert(data[1][1]),
           SpellingNumber(lang: LangKey[1]).convert(data[1][0])+ " ÷ " + SpellingNumber(lang: LangKey[1]).convert(data[1][1]),],
         "op_sign": "÷",
         "op_def": [flashcardLangData["ques_def"]["pri_lang"], flashcardLangData["ques_def"]["sec_lang"]],
         'fst_num': data[1][0],
         'snd_num': data[1][1],
       },
     ],

   };
  result = flashCards[sign]!;
  return result;
}
