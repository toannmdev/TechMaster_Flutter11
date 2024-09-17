class SinhVien {
  int agePublic = 100;
  int _age = 8;
  int get getAge {
    if (_age > 18) {
      return 20;
    }

    return _age + 55;
  } // => hàm getter

  set setAge(int age) {
    // => hàm setter
    // xử lý logic ở đây
    _age = age;
  }

  void updateAge(int age) {
    // xử lý logic ở đây
    _age = age;
  }

  String updateAge1(int age) {
    // xử lý logic ở đây
    _age = age;

    return "abc";
  }
}
