// class Person {}

// class Artist extends Person with Sketching {
//   @override
//   void sketching() {
//     print("Artist override sketching");
//   }
// }

// class Engineer extends Person with Sketching, Reading {}

// class Doctor extends Person with Reading, Excercise {}

// class Athlete extends Person {}

// class Boxer extends Athlete with Excercise, Boxing {}

// mixin Sketching {
//   void sketching() {
//     print("test");
//   }
// }

// mixin Reading {}
// mixin Excercise {}
// mixin Boxing {}

// void main() {
//   Artist().sketching();
//   Engineer().sketching();
// }

abstract class Behavior {
  void doSomething();
  void gooooo();
}

class Animal with AnimalMixin implements Behavior {

}

class Chicken extends Animal {
  @override
  void doSomething() {
    print('chicken');
  }
}

mixin AnimalMixin {
  void doSomething() {
    // TODO: implement doSomething
  }
  
  // void gooooo() {
  //   // TODO: implement gooooo
  // }
}

void main() {
  Animal().doSomething();
}
