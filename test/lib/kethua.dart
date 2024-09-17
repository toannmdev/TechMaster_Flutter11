class Parent {
  void test() {
    print("Parent");
  }
}

class Child extends Parent {
  @override
  void test() {
    print("Child"); // sẽ in ra "Child"
    super.test(); // sẽ gọi tới hàm test() ở trong class parent, in ra "Parent"
  }
}

class Child1 extends Child {
  @override
  void test() {
    print("Child1111111");
  }
}

class Shape {
  int tinhChuVi() {
    return 10;
  }
}

class HinhTamGiac extends Shape {
  @override
  int tinhChuVi() {
    return 10;
  }
}

class HinhVuong extends Shape {
  @override
  int tinhChuVi() {
    return 10;
  }
}

class HinhChuNhat extends Shape {
  @override
  int tinhChuVi() {
    return 10;
  }
}

void main() {
  Parent p = Child();

  p.test();

  var hinhTamGiac = HinhTamGiac();
  var hinhChuNhat = HinhChuNhat();
  var hinhVuong = HinhVuong();

  hinhTamGiac.tinhChuVi();
  hinhChuNhat.tinhChuVi();
  hinhVuong.tinhChuVi();
}
