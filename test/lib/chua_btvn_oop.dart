class Animal {
  final String name;

  Animal({required this.name});
}

abstract class AnimalAction {
  void diBo() {}

  void bay() {}

  void boi() {}
}

class Cho extends Animal implements AnimalAction {
  Cho({required super.name});

  @override
  void diBo() {
    print("Chó đang đi bộ.");
  }

  @override
  void bay() {
    print("Chó ước có thể bay, nhưng không thể.");
  }

  @override
  void boi() {
    print("Chó không biết bơi.");
  }
}

class Ca extends Animal implements AnimalAction {
  Ca({required super.name});

  @override
  void boi() {
    print("Cá đang bơi.");
  }

  @override
  void diBo() {
    print("Cá ước có thể đi bộ, nhưng không thể.");
  }

  @override
  void bay() {
    print("Cá không thể bay.");
  }
}

class Chim extends Animal implements AnimalAction {
  Chim({required super.name});

  @override
  void bay() {
    print("Chim đang bay.");
  }

  @override
  void boi() {
    print("Chim ước có thể bơi, nhưng không thể.");
  }

  @override
  void diBo() {
    print("Chim có thể đi bộ.");
  }
}

class Vit extends Animal implements AnimalAction {
  Vit({required super.name});

  @override
  void diBo() {
    print("Vịt đang đi bộ.");
  }

  @override
  void boi() {
    print("Vịt đang bơi.");
  }

  @override
  void bay() {
    print("Vịt đang bay.");
  }
}

void main() {
  final animals = <AnimalAction>[
    Cho(name: 'Cho'),
    Ca(name: 'Ca'),
    Chim(name: 'Chim'),
    Vit(name: 'Vit'),
    Vit(name: 'Rong'),
    Vit(name: 'Ran'),
    Vit(name: 'AAAAAA'),
  ];

  for (var element in animals) {
    element.bay();
    element.diBo();
    element.boi();

    if (element is Animal) {
      print('__________end of ${(element as Animal).name}');
    }
  }
}
