class LopHoc {
  final String tenLop;
  int _buoiHoc = 10;
  int? soLuongHocVien;
  List<HocVien>? hocVien;
  Set<TinhNangBuild> tinhNangBuild;

  LopHoc({
    required this.tenLop,
    int? buoiHoc,
    this.soLuongHocVien,
    this.hocVien,
    required this.tinhNangBuild,
  }) {
    if (buoiHoc != null && buoiHoc >= 10) {
      this._buoiHoc = buoiHoc;
    } else {
      this._buoiHoc = 10;
    }
  }

  int get buoiHoc => _buoiHoc;

  set buoiHoc(int buoi) {
    if (buoi >= 10) {
      _buoiHoc = buoi;
    } else {
      print('Số buổi học không thể ít hơn 10.');
    }
  }

  void inThongTinLopHoc() {
    print('Lop học: $tenLop');
    print('Số buổi học: $_buoiHoc');
    print('Số lượng học viên: $soLuongHocVien');
    if (hocVien != null && hocVien!.isNotEmpty) {
      print('Học viên:');
      hocVien?.forEach((hocVien) {
        print('- ${hocVien.ten}');
      });
    } else {
      print('Chưa có học viên nào.');
    }
    print('Tính năng build: $tinhNangBuild');
  }

  int soLuongConThieu() {
    if (soLuongHocVien == null) return 0;
    return (soLuongHocVien ?? 0) - (hocVien?.length ?? 0);
  }

  void ThemHocVien(int a) {
    if (hocVien == null) {
      hocVien = [];
    }
    for (int i = 0; i < a; i++) {
      if (hocVien!.contains(HocVien(ten: 'Q$i'))) {
        hocVien!.add(HocVien(ten: 'Q$i'));
      }
      hocVien!.add(HocVien(ten: 'Q$i'));
      if (hocVien!.length > soLuongHocVien!) {
        soLuongHocVien = hocVien!.length;
      }
    }
  }
}

class HocVien {
  final String ten;
  List<LopHoc>? lopHocThamGia;

  HocVien({
    required this.ten,
    List<LopHoc>? lopHocThamGia,
  }) {
    this.lopHocThamGia = lopHocThamGia ?? [];
    this.lopHocThamGia?.forEach((lopHoc) {
      if (lopHoc.hocVien == null) {
        lopHoc.hocVien = [];
      }
      if (!lopHoc.hocVien!.contains(this)) {
        lopHoc.hocVien!.add(this);
      }
      if (lopHoc.soLuongHocVien! < lopHoc.hocVien!.length) {
        lopHoc.soLuongHocVien = lopHoc.hocVien!.length;
      }
    });
  }
}

enum TinhNangBuild {
  android,
  ios,
  web,
  desktopApp,
}

class LopHocManager {
  LopHoc flutter;
  LopHoc android;
  LopHoc ios;
  LopHoc web;

  LopHocManager({
    required this.flutter,
    required this.android,
    required this.ios,
    required this.web,
  });

  void capNhatFlutter(int buoiHoc) {
    if (buoiHoc >= 12) {
      flutter.buoiHoc = buoiHoc;
      android.buoiHoc = buoiHoc + 5;
      ios.buoiHoc = android.buoiHoc + 3;
      web.buoiHoc = buoiHoc - 2;
    } else {
      print('Số buổi học của Flutter không thể ít hơn 12.');
    }
  }

  void capNhatAndroid(int buoiHoc) {
    if (buoiHoc >= 15) {
      android.buoiHoc = buoiHoc;
      flutter.buoiHoc = buoiHoc - 5;
      ios.buoiHoc = buoiHoc + 3;
      web.buoiHoc = flutter.buoiHoc - 2;
    } else {
      print('Số buổi học của Android không thể ít hơn 15.');
    }
  }

  void capNhatIOS(int buoiHoc) {
    if (buoiHoc >= 18) {
      ios.buoiHoc = buoiHoc;
      android.buoiHoc = buoiHoc - 3;
      flutter.buoiHoc = android.buoiHoc - 5;
      web.buoiHoc = flutter.buoiHoc - 2;
    } else {
      print('Số buổi học của iOS không thể ít hơn 18.');
    }
  }

  void capNhatWeb(int buoiHoc) {
    if (buoiHoc >= 10) {
      web.buoiHoc = buoiHoc;
      flutter.buoiHoc = buoiHoc + 2;
      android.buoiHoc = flutter.buoiHoc + 5;
      ios.buoiHoc = android.buoiHoc + 3;
    } else {
      print('Số buổi học của Web không thể ít hơn 10.');
    }
  }

  void inThongTinTatCaLop() {
    flutter.inThongTinLopHoc();
    android.inThongTinLopHoc();
    ios.inThongTinLopHoc();
    web.inThongTinLopHoc();
  }
}

void main() {
  LopHoc flutter = LopHoc(
      tenLop: 'Flutter',
      soLuongHocVien: 11,
      tinhNangBuild: {
        TinhNangBuild.android,
        TinhNangBuild.ios,
        TinhNangBuild.web
      });

  LopHoc android = LopHoc(
      tenLop: 'Android',
      soLuongHocVien: 15,
      tinhNangBuild: {TinhNangBuild.android});

  LopHoc ios = LopHoc(
      tenLop: 'iOS', soLuongHocVien: 12, tinhNangBuild: {TinhNangBuild.ios});

  LopHoc web = LopHoc(
      tenLop: 'Web', soLuongHocVien: 10, tinhNangBuild: {TinhNangBuild.web});

  LopHocManager manager = LopHocManager(
    flutter: flutter,
    android: android,
    ios: ios,
    web: web,
  );

  flutter.ThemHocVien(flutter.soLuongConThieu());

  print('Cập nhật số buổi học cho Flutter lên 12:');
  manager.capNhatFlutter(12);
  manager.inThongTinTatCaLop();

  print('\nCập nhật số buổi học cho Android lên 18:');
  manager.capNhatAndroid(18);
  manager.inThongTinTatCaLop();

  print('\nCập nhật số buổi học cho iOS lên 22:');
  manager.capNhatIOS(22);
  manager.inThongTinTatCaLop();

  print('\nCập nhật số buổi học cho Web lên 12:');
  manager.capNhatWeb(12);
  manager.inThongTinTatCaLop();
}