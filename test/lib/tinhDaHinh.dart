import 'dart:developer';

void main() {
  Child child = Child(input: "10", age: 18);
  Child childWithoutInput = Child.named();

  Child childFactory = Child.factory(input: 'input');
  Child c2 = Child.f2(input: 'input', age: 10);

  log('child -> ${child.input}, ${child.age}');
  log('childWithoutInput -> ${childWithoutInput.input}, ${childWithoutInput.age}');
  log('childFactory -> ${childFactory.input}, ${childFactory.age}');
  log('c2 -> ${c2.input}, ${c2.age}');
}

class Parent {
  final String input;
  int? age;
  final int? numberOfBullets, dob;

  Parent({required this.input, this.age, this.dob, this.numberOfBullets});
}

class Child extends Parent {
  Child({required super.input, super.age, super.dob, super.numberOfBullets}){
    print('đây là hàm contructor mặc định');
    init();
  }
  Child.named({super.input = 'input', super.age, super.dob, super.numberOfBullets}); // named constructor
  factory Child.factory({required String input}) {
    return Child(input: input);
  }

  factory Child.f2({required String input, int? age}) {
    int _age = 0;
    if (age == null) {
      _age = 18;
    } else {
      _age = age;
    }
    return Child(input: input, age: _age);
  }

  void init(){
    super.age = 99;
  }
}
