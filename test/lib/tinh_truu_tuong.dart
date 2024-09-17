abstract class TestAbstractClass {
  late final int a;

  void lapKeHoach();
}

class Dunggggg implements TestAbstractClass {
  @override
  int a = 10;

  @override
  void lapKeHoach() {
    // TODO: implement lapKeHoach
  }
}

class Daiiii implements TestAbstractClass {
  @override
  int a = 10;

  @override
  void lapKeHoach() {
    // TODO: implement lapKeHoach
  }
}

abstract class Thang extends TestAbstractClass {
  void thangFnc();
}

class ThangImpl extends TestAbstractClass {
  final TestAbstractClass abstraction;

  ThangImpl({required this.abstraction});
  @override
  void lapKeHoach() {
    abstraction.lapKeHoach();
  }
}

class ThangImpl1 implements Thang, TestAbstractClass {
  ThangImpl? thangImpl;

  ThangImpl1();
  @override
  void lapKeHoach() {}

  @override
  void thangFnc() {}

  @override
  int a = 90;

  void setOnCallback(ThangImpl thangImpl) {
    this.thangImpl = thangImpl;

    ThangImpl newImpl = ThangImpl(abstraction: this);
  }
}

void main(List<String> args) {
  TestAbstractClass a = Dunggggg();

  ThangImpl1 thangImpl = ThangImpl1();
  thangImpl.thangImpl = ThangImpl(abstraction: thangImpl);
  thangImpl.setOnCallback(ThangImpl(abstraction: thangImpl));
  thangImpl.a;
}




class HocVien {
  final List<LopHoc> lopss = [];
}

class LopHoc{
  final List<HocVien> hocvienss = [];
}