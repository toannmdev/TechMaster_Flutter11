// void main() {
//   var a = TenClass(
//       input: "input1234567",
//       s: 'tôi truyền vào từ dòng số 2'); // TenClass() là hàm khởi tạo

//   print('a -> ${a.s}');
//   print('a.input -> ${a.input}');

//   a.testClass();

//   String aa = '';
//   // aa.testClass();

//   // testClass();

//   aa.toString();
// }

// void ham() {}

// class TenClass {
//   final String input;

//   String? s;

//   B? b;

//   TenClass(
//       {required this.input,
//       this.s =
//           'giá trị mặc định từ hàm khởi tạo'}); // là hàm khởi tạo với 1 tham số

//   void testClass() {
//     print('testClass function');
//   }
// }

// class B {}

// enum Gender {
//   male(1),
//   female(2),
//   ;

//   const Gender(this.gender);

//   final int gender;
// }

// void main() {
//   Mercenary m1 =  Mercenary(
//       age: 18,
//       gun: const Gun(
//         name: 'sung phong luuuu',
//         numberOfBullets: 1,
//       ),
//       name: 'm1');

//   Mercenary m2 =  Mercenary(
//       age: 18,
//       gun: const Gun(
//         name: 'Dao',
//         numberOfBullets: 1,
//       ),
//       name: 'm2');
// }

// class Mercenary {
//   // class
//   final String name; // 1 properties trong class
//   final int age;
//   final Gun gun; // class chứa 1 đối tượng khác

//   Function? function;

//   // hàm khởi tạo Mercenary với 3 tham số bắt buộc
//    Mercenary({required this.name, required this.age, required this.gun});

//   void shot() {} // 1 phương thức của Mercenary
// }

// class Gun {
//   final String name;
//   final int numberOfBullets;

//   const Gun({required this.name, this.numberOfBullets = 0});
// }

// import 'folderrrrrr/sv.dart';

// void main(List<String> args) {
//  SinhVien sv = SinhVien();
//  print(sv.getAge);

//  sv.agePublic = 100000;
// //  sv._age = 100000;
//  sv.setAge = 10;
//  print("sv age is ${sv.getAge}");
// }

import 'dart:developer';

void main() {
  Mercenary m1 = const Mercenary(
      age: 18,
      weapon: Gun(
        name: 'sung phong luuuu',
        numberOfBullets: 1,
      ),
      name: 'm1');
  Mercenary m2 = const Mercenary(age: 18, weapon: Knife(name: 'Dao'), name: 'm2');

  if(m2.weapon is Gun){ log('gunnnnnn');}
  if(m2.weapon is Knife){ log('Knife');}
}
class C {
  final String name;
  const C({required this.name}); // 1 properties trong class
}
class Person extends C {
  // class
  final int age;
  const Person({required super.name, required this.age});
}
class Mercenary extends Person {
  // kế thừa
  final Weapon weapon; // class chứa 1 đối tượng khác
  // hàm khởi tạo Mercenary với 3 tham số bắt buộc
  // const Mercenary({required name, required age, required this.gun})
  //     : super(name: name, age: age);
  const Mercenary({required super.name, required super.age, required this.weapon});
}
class Weapon {
  final String name;  const Weapon({required this.name});
}
class Gun extends Weapon {
  final int numberOfBullets; const Gun({required super.name, this.numberOfBullets = 0});
    void shot() {} // 1 phương thức của Mercenary
}
class Knife extends Weapon {
  const Knife({required super.name});
}
