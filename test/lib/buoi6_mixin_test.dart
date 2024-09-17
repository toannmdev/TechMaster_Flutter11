void main(List<String> args) {
  Person person = Person(name: "David");
  person.run();
}

class Person with ActionSwim, ActionRun {
  final String name;

  Person({required this.name});
}

mixin ActionSwim {
  void run() {
    print("swim");
  }
}

mixin ActionRun {
  void run() {
    print("run");
  }
}
