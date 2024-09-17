import 'dart:developer';

void main() {
  List arr = [
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
  String str =
      '${'${t1 + t.substring(1) + ' ' + arr[5] + ' ' + arr[4] + ' ' + arr[9][1] + ' ' + arr[8][true] + ' ' + arr[8][1] + ' ' + arr[9][0]} ${arr[1]} ' + arr[9][2]} ';

  String t2 = arr[11]["flutter"];
  String t3 = arr[8][false];
  t3 = t3.replaceAll('dart basics', 'dart basic');
  str +=
      '${t2[t2.indexOf('d')].toUpperCase()}${t2.substring(1)}: ${t3.toUpperCase()} ' +
          arr[10];
  log(str);
  // String tams = 'Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)';
  // log('${str.length == tams.length}');
}
