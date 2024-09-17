// void main(List<String> args) {
//   void test(String test, double d) {
//     print("Đây là hàm test, params test: $test, $d");
//   }

//   /// viết và gọi function (hàm)
//   /// cách gọi hàm phổ biến
//   test(
//     "cách gọi hàm phổ biến",
//     10.7,
//   ); // sẽ in ra: Đây là hàm test, params test: cách gọi hàm phổ biến

//   function();

//   function.call();
// }

// int function() {
//   return 90;
//   return '90';
// }

// void main(List<String> args) {
//   functionTest(() {
//     print('Đây là hàm test');
//     print('aaaa');
//   });
// }

// // void test(String test) {
// //   print("Đây là hàm test, params test: $test");
// // }

// void functionTest(Function function) {
//   function.call();
// }

// void diToiCaiCua_Easy(
//   Function reTrai,
// ) {
//   reTrai.call();
// }

// void diToiCaiCua(
//   // đinh nghĩa hàm
//   Function reTrai,
//   Function(String a) rePhai,
// ) {
//   reTrai(); // tương tự dòng 49
//   reTrai.call();

//   rePhai('10000'); // tương tự dòng 52
//   rePhai.call('10000');

//   String a = 'aaaaaa';
//   a.toUpperCase();
//   print('a -> $a');
// }

// void main() {
//   diToiCaiCua(
//     // gọi hàm ae nhé
//     () {
//       print('re trai thanh cong');
//       print('re trai thanh cong1111');
//     },
//     (a) => print('re phai thanh cong, a = $a\n đã xuống dòng\nthêm 1 dòng'),
//   );
// }

// void functionWithOptionalParam({String a = "a", String b = "b"}) {
//   print("params a=$a, b=$b");
// }

// void functionWithPositionalParam(String a, [String b = "", c = 90, d = ""]) {
//   print("params a=$a, b=$b, b=$c, d=$d");
// }

// void main(List<String> args) {
//   /// function trong dart hỗ trợ optional params,
//   /// - nếu không truyền params vào function: params sẽ nhận giá trị mặc định
//   /// - nếu truyền params vào function: params sẽ nhận giá trị được truyền vào từ function
//   functionWithOptionalParam(); // sẽ in ra: params a=a, b=b

//   functionWithOptionalParam(
//       b: "không phải giá trị b", a: "không phải giá trị a");
//   // sẽ in ra: params a=không phải giá trị a, b=không phải giá trị b

//   functionWithPositionalParam("a", "b",
//       "c"); // sẽ in ra: params a=a, b=b, b=c, d=, vì không truyền vào d, nên d=""
// }

// void main() {
//   int value = 0;

//   void test(param) {
//     value = 10; // chỉ thay đổi biến value, trong scope function test
//     print("trong function test value -> $value");
//   }

//   int testValue(int value) {
//     value = 10; // chỉ thay đổi biến value, trong scope function test
//     return value;
//   }

//   test(true);
//   value = testValue(value);
//   print("ngoài fuction test value -> $value"); // kết quả value = 0
// }

// void main(List<String> args) {
//   /// Khai báo biến var
//   /// Ưu điểm: nhanh, và không cần quan tâm tới [runtimeType]
//   // int iii = 10;
//   //  iii = '10';

//   // var intVar = 10;
//   // intVar = '';

//   var a = 10.0;

//   dynamic d = 10;
//   d = '10';
//   d = true;
//   d = ['aaa'];

//   void dynamicTest(dynamic params) {
//     // params = params + 1;
//     print('dynamicTest -> params ${params.runtimeType}');
//   }

//   dynamicTest('');
//   dynamicTest(111);
//   dynamicTest(true);

//   const con = 10;
//   con = 11;

//   final fin = 'b';
//   fin = 'ccc';
// }

// void test({String? param}) {
//   print(param);

//   param?.toUpperCase();

//   if (param != null) {
//     param.toUpperCase();
//   }
// }

// void test1({required String param}) {
//   print(param);
// }

// void test2({String param = 'default'}) {
//   print(param);
// }

// void main(List<String> args) {
//   /// khi áp dụng `Null safety`, không thể khai báo string s = null
//   /// theo cách thông thường;
// //  String s = null; // sẽ báo lỗi, vì String ở đây không thể nhận giá trị null
//   String? sCanBeNull;
//   print("sCanBeNull -> $sCanBeNull"); // sẽ in ra sCanBeNull -> null

//   test();
//   test1(param: '....');
//   test2();
// }

// void main(List<String> args) {
//   String? sCanBeNull = null;

//   // List<String> splitteds_3 = sCanBeNull?.split("") ?? ['....'];
//   // print('splitteds_3 -> $splitteds_3');

//   // /// ở đây, sẽ thực thi như sau:
//   // /// Nếu `sCanBeNull` != null sẽ gọi hàm split("") và trả về giá trị
//   // /// Nếu `sCanBeNull` == null sẽ trả về giá trị []
//   // /// 1 vài ví dụ về `Null-aware`
//   // sCanBeNull ??= "Value"; // nếu sCanBeNull = null, sCanBeNull = "Value"
//   // sCanBeNull ??= "Test"; // sCanBeNull sẽ không được cập nhật, vì giá trị hiện tại = "Value"
//   // print("sCanBeNull -> $sCanBeNull");

//   List<String> splitteds_4 =
//       sCanBeNull != null ? ['nottt null'] : sCanBeNull?.split("") ?? ['....'];
// }

// void main(List<String> args) {
//   int a = 10;
//   a *= 2; // a = a * 2
//   print("a -> $a");
//   a = a + 1; // tương tự với a++ hoặc ++a
//   a = a - 1; // tương tự với a-- hoặc --a
//   a = a * 2; // tương tự với a*=2
//   a = (a / 2)
//       as int; // tương tự với a/=2, phép chia sẽ trả về double, as int để ép kiểu sang int
//   a = 10 ~/ 6; // chia lấy nguyên, cẩn thận nhầm với /~ là toán tử bitwise
//   a = 10 % 6; // chia lấy dư
//   int b = 10 * (9 - 8);

//   a++;
//   print("b -> $b");
//   a >> b;
// }

// void main(List<String> args) {
//   String str = "Hello World";
//   int a = 10;
//   bool b = str == a;

//   print(str == a); // so sánh =, equal; sẽ in ra: false
//   print(10 == a); // so sánh =, equal; true

//   print(str != a); //so sánh khác, not equal; sẽ in ra: true
//   print(10 > a); // so sánh lớn hơn, sẽ in ra: false
//   print(10 >= a); // so sánh lớn hơn hoặc bằng, sẽ in ra: true
//   print(10 < a); // so sánh nhỏ hơn, sẽ in ra: false
//   print(10 <= a); // so sánh nhỏ hơn hoặc bằng, sẽ in ra: true
// }

// void main(List<String> args) {
//   String str = "Hello World";
//   int a = 10;

//   print(str == a ||
//       a ==
//           10); // `||` là hoặc, 1 trong 2 điều kiện đúng -> true; sẽ in ra: false
//   print(str == a &&
//       a == 10); // `&&` là hoặc, cả 2 điều kiện đúng -> true; sẽ in ra: false

//   /// 3 cách viết này cho ra kết quả giống nhau:
//   if ((str == a) == false) {
//     print("true");
//   }

//   if (!(str == a)) {
//     print("true");
//   }

//   if (str != a) {
//     print("true");
//   }

//   if (true) {
//     print("true");
//   }
// }

// void main(List<String> args) {
//   // code metric
//   // complexity = 10
//   int a = 10;

//   /// cách viết phổ biến
//   if (a == 10) {
//     print("a == 10");
//     if(a == 5){
//       if(a >= 3){
//         ///
//         if(a != 0){
//           print('oreka');
//         }
//       }
//     }
//   } else if (a != 10) {
//     print("a != 10");
//   } else {}

//   /// cách viết tắt:
//   /// sau `?` là biểu thức thực hiện khi điều kiện đúng,
//   /// sau `:` là biểu thức thực hiện khi điều kiện sai
//   print("${a == 10 ? 'a == 10' : 'a != 10'}");
//   print("${a == 10 ? a != 10 ? '' : 'a != 10' : ''}");
// }

// void main(List<String> args) {
//   dynamic a = 10;

//   a = "Hello world";
//   if (a is int) {
//     double b = a.toDouble();
//     print("b -> $b");
//   } else {
//     print("can not parse a");
//   }
// }

void _functionBuoi3(){

}

int _private = 0;
int public = 10;

void main() {
  _functionBuoi3();

  _private = 10;
  public = 20;
}

void aaaa(){}