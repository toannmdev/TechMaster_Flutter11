
import 'dart:developer';

void main() {
  List<dynamic> arr = [
    1,
    2,
    3,
    "đây",
    "kết",
    "là",
    true,
    false,
    {true: "buổi", 1: "học", 10.2: ":", false: "dart basics"},
    ['thứ', 'quả', 'về'],
    "(phần 1)",
    {"flutter": "dart"},
  ];

  String t = arr[3];
  String t1 = t[0].toUpperCase();
  StringBuffer str = StringBuffer()
    ..write('${t1 + t.substring(1)} ')
    ..write('${arr[5]} ')
    ..write('${arr[4]} ')
    ..write('${arr[9][1]} ')
    ..write('${arr[8][true]} ')
    ..write('${arr[8][1]} ')
    ..write('${arr[9][0]} ${arr[1]} ')
    ..write('${arr[9][2]} ');

  String t2 = arr[11]["flutter"];
  String t3 = arr[8][false].replaceAll('dart basics', 'dart basic');

  str.write('${t2[0].toUpperCase()}${t2.substring(1)}: ${t3.toUpperCase()} ');
  str.write(arr[10]);

  log(str.toString());
  // String tams = 'Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)';
  // log('${str.length == tams.length}');
}