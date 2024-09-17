void main() {}

abstract class LopHoc {
  String get name;
}

final class Flutter extends LopHoc {
  String get name => "Flutter";
}

final class LopHocAbstract {
  final String name;

  LopHocAbstract({required this.name});
}

final class Flutterttt extends LopHocAbstract {
  Flutterttt({required super.name});

  final List<int> hocViens = [];
}

final class HocVien {
  final List<LopHocAbstract> lopHocs = [];

  HocVienBehavior? behavior;

  void setOnBehavior(HocVienBehavior? behavior) {
    this.behavior = behavior;
  }

  void updateLopHoc(LopHoc lopHoc) {
    behavior?.onChanged(lopHoc);
  }
}

abstract class HocVienBehavior {
  void onChanged(LopHoc lopHoc);
}
