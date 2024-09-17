void main(List<String> args) {
  A a = A(input: 'a');
  A a1 = A(input: 'a');

  print(a.input == a1.input);
  print(a == a1);

  print('a -> ${a.hashCode}');
  print('a1 -> ${a1.hashCode}');

  final b = B();
  final b1 = B();
  final b2 = B();
  final b3 = B();
  final b4 = B();

  print(b == b1);
  print(b == b1);
}

class A {
  final String input;

  A({required this.input});
}

class B {
  static final B _singleton = B._();
  
  factory B() {
    return _singleton;
  }
  
  B._();
}