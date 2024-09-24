abstract class LopHoc {
  final String tenLop;
  int _buoiHoc = 10;
  int? soLuongHocVien;
  List<HocVien>? hocVien;
  Set<TinhNangBuild> tinhNangBuild;

  final LopHocManager lopHocManager = LopHocManager();

  LopHoc({
    required this.tenLop,
    int? buoiHoc,
    this.soLuongHocVien,
    this.hocVien,
    required this.tinhNangBuild,
  }) {
    if (buoiHoc != null) {
      setBuoiHoc = buoiHoc;
    }

    lopHocManager.addClass(this);
  }

  int get buoiHoc => _buoiHoc;

  set setBuoiHoc(int buoi) {
    if (buoi >= 10) {
      _buoiHoc = buoi;
    } else {
      print('Số buổi học không thể ít hơn 10.');
    }

    lopHocManager.updateSLBuoiHoc(this, buoi);
  }

  // void inThongTinLopHoc() {
  //   print('Lop học: $tenLop');
  //   print('Số buổi học: $_buoiHoc');
  //   print('Số lượng học viên: $soLuongHocVien');
  //   if (hocVien != null && hocVien!.isNotEmpty) {
  //     print('Học viên:');
  //     hocVien?.forEach((hocVien) {
  //       print('- ${hocVien.ten}');
  //     });
  //   } else {
  //     print('Chưa có học viên nào.');
  //   }
  //   print('Tính năng build: $tinhNangBuild');
  // }

  int soLuongConThieu() {
    if (soLuongHocVien == null) return 0;
    return (soLuongHocVien ?? 0) - (hocVien?.length ?? 0);
  }

  // void themHocVien(int a) {
  //   hocVien ??= [];

  //   for (int i = 0; i < a; i++) {
  //     if (hocVien!.contains(HocVien(ten: 'Q$i'))) {
  //       hocVien!.add(HocVien(ten: 'Q$i'));
  //     }

  //     hocVien!.add(HocVien(ten: 'Q$i'));
  //     if (hocVien!.length > soLuongHocVien!) {
  //       soLuongHocVien = hocVien!.length;
  //     }
  //   }
  // }
}

final class FlutterClass extends LopHoc {
  FlutterClass({
    super.tenLop = 'FlutterClass',
    required super.tinhNangBuild,
    super.soLuongHocVien,
  });
}

final class AndroidClass extends LopHoc {
  AndroidClass({
    super.tenLop = 'AndroidClass',
    required super.tinhNangBuild,
    super.soLuongHocVien,
  });
}

final class IosClass extends LopHoc {
  IosClass({
    super.tenLop = 'IosClass',
    required super.tinhNangBuild,
    super.soLuongHocVien,
  });
}

final class WebClass extends LopHoc {
  WebClass({
    super.tenLop = 'WebClass',
    required super.tinhNangBuild,
    super.soLuongHocVien,
  });
}

class HocVien {
  // final String ten;
  // List<LopHoc>? lopHocThamGia;

  // HocVien({
  //   required this.ten,
  //   List<LopHoc>? lopHocThamGia,
  // }) {
  //   this.lopHocThamGia = lopHocThamGia ?? [];
  //   this.lopHocThamGia?.forEach((lopHoc) {
  //     lopHoc.hocVien ??= [];

  //     if (!lopHoc.hocVien!.contains(this)) {
  //       lopHoc.hocVien!.add(this);
  //     }

  //     if (lopHoc.soLuongHocVien! < lopHoc.hocVien!.length) {
  //       lopHoc.soLuongHocVien = lopHoc.hocVien!.length;
  //     }
  //   });
  // }
}

enum TinhNangBuild {
  android,
  ios,
  web,
  desktopApp,
}

/// Quản lý toàn bộ lớp học
final class LopHocManager {
  final List<LopHoc> classes = [];

  LopHocManager();

  void addClass(LopHoc lopHoc) {
    assert(!classes.contains(lopHoc));

    classes.add(lopHoc);
  }

  void updateSLBuoiHoc(LopHoc lopHoc, int buoiHoc) {
    if (lopHoc is FlutterClass) {}
    if (lopHoc is AndroidClass) {}
    if (lopHoc is IosClass) {}
    if (lopHoc is WebClass) {}
  }
}

void main() {
  LopHoc flutter = FlutterClass(soLuongHocVien: 11, tinhNangBuild: {
    TinhNangBuild.android,
    TinhNangBuild.ios,
    TinhNangBuild.web
  });

  LopHoc android =
      AndroidClass(soLuongHocVien: 15, tinhNangBuild: {TinhNangBuild.android});

  LopHoc ios = IosClass(soLuongHocVien: 12, tinhNangBuild: {TinhNangBuild.ios});

  LopHoc web = WebClass(
      tenLop: 'Web', soLuongHocVien: 10, tinhNangBuild: {TinhNangBuild.web});

  // flutter.themHocVien(flutter.soLuongConThieu());

  // print('Cập nhật số buổi học cho Flutter lên 12:');
  // manager.capNhatFlutter(12);
  // manager.inThongTinTatCaLop();

  // print('\nCập nhật số buổi học cho Android lên 18:');
  // manager.capNhatAndroid(18);
  // manager.inThongTinTatCaLop();

  // print('\nCập nhật số buổi học cho iOS lên 22:');
  // manager.capNhatIOS(22);
  // manager.inThongTinTatCaLop();

  // print('\nCập nhật số buổi học cho Web lên 12:');
  // manager.capNhatWeb(12);
  // manager.inThongTinTatCaLop();
}
