// void main() {
//   /// Có thể sử dụng nháy đơn '' hoặc nháy kép "" để khai báo 1 string
//   // đây không phải là dòng code 12376812y31b2mnbsàmnabsfmn
//   //123123123213123
//   String s = 'Hello world ';
//   String s1 = "Hello world";

//   String s2 = '''Hello world ''';
//   String s3 = '''
//     Hôm nay tôi đi học
//     trời mưa rất to
//     sấm chớp đùng đùng
//     ...
//   ''';

//   String s4 = """
//     Hôm nay tôi đi học
//     trời mưa rất to
//     sấm chớp đùng đùng
//     ...
//   """;
// }

// void main(List<String> args) {
//   String s = 'Hello world ';
//   /// Tách kí tự trong 1 chuỗi
//   //  Tách kí tự trong 1 chuỗi
//   List<String> splittedStrs = s.split(" ");
//   print(
//     "splittedStrs -> $splittedStrs",
//   ); // sẽ in ra: splittedStrs -> [Hello, world]

//   /// kiểm tra 1 string có chứa 1 string khác không
//   bool hasWorldStr = s.contains("worldd");
//   print("hasWorldStr -> $hasWorldStr"); // sẽ in ra: hasWorldStr -> true

//   String bienHomNayToiDiHoc = "Hôm nay tôi đi học";
//   String bien_hom_nay_toi_di_hoc = "Hôm nay tôi đi học";

//   /// tránh đặt tên biến như này nhé
//   String homnaytoidihoc = "Hôm nay tôi đi học";

//   print('hôm nay ngày 24');
// }

// void main(List<String> args) {
//   String s = 'Hello world ';

//   /// chuyển đổi tất cả kí tự về kí tự viết hoa, viết thường
//   String sUpperCase = s.toUpperCase();
//   String sLowerCase = s.toLowerCase();

//   print("sUpperCase -> $sUpperCase"); // sẽ in ra: sUpperCase -> HELLO WORLD
//   print("sLowerCase -> $sLowerCase"); // sẽ in ra: sLowerCase -> hello world
//   /// lấy vị trí đầu tiên của kí tự 'o'
//   int sIndexOf = s.indexOf("o");
//   print("sIndexOf -> $sIndexOf"); // sẽ in ra: sIndexOf -> 4

//   print('đây là nối biến: sIndexOf');
//   print('đây là nối biến: $sIndexOf');
//   print('đây là nối biến: ${s.indexOf("o") + 10}');

//   print('đây là nối biến:sIndexOfabc');

// void main(List<String> args) {
//   String s = 'Hello world ';

//   /// kiểm tra xem string bắt đầu với kí tự 'H'
//   bool sStartWith = s.startsWith("H");
//   print("sStartWith -> $sStartWith"); // sẽ in ra: sStartWith -> true

//   /// thay thế các kí tự trong 1 chuỗi
//   String sReplaced = s.replaceAll("world", "everyone");
//   print("sReplaced -> $sReplaced"); // sẽ in ra: sReplaced -> Hello everyone

//   /// loại bỏ khoảng trắng ở đầu/cuối string
//   String sTrimmed = s.trim();
//   print("s -> \"$s\""); // sẽ in ra: s -> "Hello world "
//   print('s -> "$s"'); // sẽ in ra: s -> "Hello world "

//   print("sTrimmed -> $sTrimmed"); // sẽ in ra: sTrimmed -> Hello world
// }

// void main(List<String> args) {
//   int a = 10;
//   int b = -10;

//   print("a = $a"); // sẽ in ra: a = 10
//   print("b = $b"); // sẽ in ra: b = -10
// }

// void main(List<String> args) {
// double a = 10;
// double b = -10.0;

// int c = 10;
// int d = -10;

// int _resultInt = (a + b + c + d).toInt();
// double _resultDouble = (a + b + c + d);

// print("_resultInt -> $_resultInt"); // sẽ in ra: _resultInt -> 0
// print("_resultDouble -> $_resultDouble"); // sẽ in ra: _resultDouble -> 0.0

// print(_resultInt == _resultDouble);
// }

// void main(List<String> args) {
//   int a = 10;
//   double b = -10.0;

//   String _aStr = a.toString();
//   String _aStr1 = '$a';
//   String _bStr = b.toString();

//   print("int a toString: $_aStr"); // sẽ in ra: int a toString: 10

//   print("double b toString: $_bStr"); // sẽ in ra: double b toString: -10.0
// }

// void main(List<String> args) {
//   int a = 10;
//   double _aDouble = a.toDouble();

//   print("int a toDouble: $_aDouble"); // sẽ in ra: int a toDouble: 10.0
//   print(
//       "double to int: ${(_aDouble + 0.9).toInt()}"); // sẽ in ra: double to int: 10

//   String c = "20.0";
//   bool sStartWith = c.startsWith("H");

//   int _cInt = int.parse(c);
//   double _cDouble = double.parse(c);

//   print("Parse String c to int: $_cInt"); // sẽ in ra: Parse String c to int: 20
//   print(
//       "Parse String c to double: $_cDouble"); // sẽ in ra: Parse String c to double: 20.0
// }

// void main(List<String> args) {
//  bool a = true;
//  bool b = false;

//  if (a && !b) { /// so sánh nhiều mệnh đề, viết tắt
//    print("a == true and b == false"); // sẽ in ra: a == true and b == false
//  }

//  if (a || b) { /// so sánh nhiều mệnh đề, viết tắt
//    print("a == true or b == true"); // sẽ in ra: a == true and b == false
//  }
// }

import 'dart:developer';

// void main(List<String> args) {
//   List strs = [
//     "a", // 0
//     "b", // 1
//     "c", // 2
//     true, // 3
//     false, // 4
//     [
//       1, // 0
//       'a', // 1
//       false, // 2
//       [1, 2, 3], // 3
//     ]
//   ];

//   /// cách viết tắt
//   List<String> strs_1 = <String>["a", "b", "c"];

//   print(strs[0]);
//   print(strs[1]);
//   print(strs[2]);
//   print(strs[3]);
//   print(strs[5][3][1]);

//   strs_1.add('d');
//   print('strs_1 -> $strs_1');

//   strs_1.addAll(['e', 'f', 'g', 'h']);
//   print('strs_1 -> $strs_1');

//   strs_1.remove('d');
//   print('strs_1 -> $strs_1');

//   int index = strs_1.indexOf('h');
//   print('index -> $index');
//   strs_1.removeAt(index);
//   print('strs_1 -> $strs_1');
//   strs_1.removeRange(2, 5);
//   print('strs_1 -> $strs_1');

//   List newList = strs_1.sublist(1);
//   print('newList -> $newList');
//   print('length -> ${newList.length}');

//   List<int> intsss = [0,1,2,3];
//   List<String> strssss = newList.map((e) => '$e').toList();
//   List<String> strsssss = newList.map((e) {
//     print('asfasfa');
//     print('asfasfa');
//     print('asfasfa');
//     print('asfasfa');
//     print('asfasfa');
//     print('asfasfa');
//     return '$e';
//   }).toList();

//   log('length -> ${newList.length}');
//   /// cách viết rõ nghĩa, sử dụng [generic]
// }

void main(List<String> args) {
  /// cách viết ngắn gọn
  Map map = {
    "key": "value",
    "key": "value123",
  };
  print("map -> $map");
  // sẽ in ra: map -> {key: value}
  /// cách viết rõ nghĩa
  Map map1 = Map<String, String>();
  map1["key"] = "value";
  print("map1 -> $map1");
  // sẽ in ra: map1 -> {key: value}

  Map map12 = {"homnay": "troimuaratto"};
  Map map123 = {
    [1, 2, 3]: "abc"
  };

  Map newMap = map..addAll({'abc': 123});
  print('keys -> ${map.keys}');
  print('values -> ${map.values}');

  print("map -> $map");


  print("Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)");
}
