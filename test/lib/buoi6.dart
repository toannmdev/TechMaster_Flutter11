abstract class Person {}

class Artist extends Person implements Sketching {
  @override
  void sketching() {
    print("test........");
  }

  final GoAround goAround = GoAround();

  void go(){
    goAround.go();
  }
}

class Engineer extends Person implements Sketching, Reading {
  @override
  void sketching() {
    print("test123");
  }

  final GoAround goAround = GoAround();

  void go(){
    goAround.go();
  }
}

class Doctor extends Person implements Reading, Excercise {}

class Athlete extends Person {}

class Boxer extends Athlete implements Excercise, Boxing {}

abstract class Sketching {
  void sketching() {
    print("_________");
  }
}

abstract class Reading {}

abstract class Excercise {}

abstract class Boxing {}


void main() {
  Artist().sketching();
  Engineer().sketching();
}


class GoAround{
  void go(){
    print('go');
  }
}