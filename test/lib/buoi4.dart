// void main() {
//   String a = 'abcc';
//   a = a.test('không phải a');

//   final result = a.toUpperCase();

//   print('result -> $result');

//   test111();
// }

// void test111() {}

// extension _TestExt on String {
//   String test(String a) {
//     print('test: $this, $a');

//     return 'test: $this, $a';
//   }
// }

// void main() {
//   int a = 8;
//   int b = 8;

//   print('identical: ${!!identical(a, b)}');

//   if (a == 1) {
//     print("a == 1");
//   } else if (a == 2) {
//     print("a == 2");
//   } else {
//     print("else");
//   }
// }

// void main() {
//   /// vòng for cơ bản, theo index
//   for (int i = 0; i < 10; i = i + 1) {
//     if (i == 2 || i == 3) {
//       continue;
//     }
//     print('i= $i');
//     if (i == 5) {
//       break;
//     }
//     if (i == 5) {
//       i = 10;
//     }
//   }

//   // foreach
//   final arrs = [0, 1, 2, 3, 4, 5];
//   arrs.forEach((element) {
//     print('foreach item = $element');
//   });

//   for (var element in arrs) {
//     break;
//     print('for in item = $element');
//     arrs.add(10);
//   }
// }

// void main(List<String> args) {
//   int x = 0;
//   // trong khi 1 điều kiện đúng, thực thi 1 khối lệnh
//   while (x < 10) {
//     x++;
//     print("x -> $x");
//     // sẽ in ra các giá trị từ 1 -> 10,
//     // khi x = 10, while sẽ dừng, vì điều kiện để chạy while là x < 10
//   }

//   print('before do-while, x = $x');

//   do {
//     x++;
//     print("x -> $x"); // sẽ in ra giá trị của x từ 1 -> 10
//   } while (x > 0 && x < 10);
// }

// enum DayOfWeeks {
//   monday(1, 'Monday'),
//   tuesday(2, 'Tuesday'),
//   wednesday(3, 'Wednesday'),
//   thursday(4, 'Thursday'),
//   friday(5, 'Friday'),
//   saturday(6, 'Saturday'),
//   sunday(0, 'Sunday'),
//   ;

//   const DayOfWeeks(this.value, this.displayName);

//   final int value;
//   final String displayName;
// }

// extension DayOfWeeksExt on DayOfWeeks {
//   String getVnName() {
//     if (this == DayOfWeeks.monday) {
//       return 'ifffff Thứ 2';
//     }
//     switch (this) {
//       case DayOfWeeks.monday:
//         return "Thứ 2";
//       case DayOfWeeks.tuesday:
//         return "Thứ 3";
//       case DayOfWeeks.wednesday:
//         return "Thứ 4";
//       case DayOfWeeks.thursday:
//         return "Thứ 5";
//       case DayOfWeeks.friday:
//         return "Thứ 6";
//       case DayOfWeeks.saturday:
//         return "Thứ 7";
//       case DayOfWeeks.sunday:
//         return "Chủ nhật";
//       default:
//         return "Không xác định";
//     }
//   }
// }

// void main(List<String> args) {
//   List<DayOfWeeks> dayOfWeeks = DayOfWeeks.values;
//   for (var element in dayOfWeeks) {
//     print(
//         "day is: ${element.getVnName()}, ${element.displayName}"); // sẽ in ra: các ngày từ thứ 2 -> chủ nhật
//   }
// }

// void main(List<String> args) {
// //  int
// //    b = int.parse("Hello world");

//   int a = 10;
//   try {
//     a = int.parse("Hello world");

//     /// khi parse int sẽ gây ra lỗi, nhưng được bọc bởi try catch
//     /// nên sẽ không thể print ra biến a
//     print("after parse, a = $a");
//   } catch (ex, stackTrace) {
//     print(
//         "exception -> ${ex.toString()}, $stackTrace"); // exception -> FormatException: Hello world
//   } finally {
//     print('finally');
//   }

//   print('after catch');
// }

// import 'dart:io';

// void main(List<String> args) {
//   int a = 10;

//   try {
//     a = int.parse("Hello world");
//   } on FormatException {
//     print("on format exception"); // sẽ in ra: on format exception
//   } on SocketException {
//     print("on socket exception}");
//   } catch (ex){
//     print('ex -> $ex');
//   } finally {
//     print('finally');
//   }
// }

// void main(List<String> args) {
//   void checkANumber({int? number}) {
//     if (number == null || number <= 0) {
//       throw Exception("number must >= 0");
//     }

//     print("number is $number");
//   }

//   try {
//     checkANumber();
//   } catch (ex) {
//     print('checkANumber ex -> $ex');
//   }

//   void checkANumberWithAssert(int input){
//     assert(input > 10, "number must > 10..........>.<");
//     assert(input > 10);
//   }

//   checkANumberWithAssert(5);

//   print('object');
// }

// typedef FunctionTest = String Function(String input, int d, int e, double c);

// void test(FunctionTest a) {
//   String result = a.call('aaaaa', 1, 2, 3);
//   print('result -> $result');
// }

// void main() {
//   test((a, d, e, c) {
//     return '1000000';
//   });
// }

import 'dart:math';

void main() {
  int deQuy(int i) {
    if (i == 0) {
      return 0;
    }

    print('i -> $i');
    return deQuy(i - 1);
  }

  deQuy(10);

  double d = sqrt(10);
  print('d -> $d');
}

int deQuy1(int i, int d, bool a) {
  if (i == 0) {
    return 0;
  }

  print('i -> $i');
  return deQuy1(i - 1, d, a);
}

int deQuy2(int i, int d) {
  if (i == 0) {
    return 0;
  }

  print('i -> $i');
  return deQuy1(i - 1, d);
}

int deQuy3(int i, int d) {
  if (i == 0) {
    return 0;
  }

  print('i -> $i');
  return deQuy1(i - 1, d);
}

int deQuy4(int i, int d) {
  if (i == 0) {
    return 0;
  }

  print('i -> $i');
  return deQuy1(i - 1, d);
}









// void main() {
//   (int, int) swap((int, int) record) {
//     var (a, b) = record;
//     return (b, a);
//   }

//   (int, int) addAValue((int, int) record, int addValue) {
//     var (a, b) = record;
//     return (a + addValue, b - addValue);
//   }

//   print(swap((10, 20)));
//   print(addAValue((10, 20), 1000));

//   ({int a, int b}) recordAB = (a: 1, b: 2);
//   ({int x, int y}) recordXY = (x: 3, y: 4);

//   print('recordAB -> ${recordAB.a}');
// }
