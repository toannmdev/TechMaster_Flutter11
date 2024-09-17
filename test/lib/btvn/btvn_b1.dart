import 'dart:developer';

void main() {
  String str =
      " đây là kết quả của buổi học thứ 2 về dart: dart basics (phần 1)...";
  str = str.trim();
  int d = str.indexOf('đ');
  String tam = str[d]
      .toUpperCase(); // bien: ây là kết quả của buổi học thứ 2 về dart: dart basics (phần 1)...
  str = str.substring(1);
  tam += str;

  int d1 = tam.indexOf('d');
  String tam1 =
      tam.substring(0, d1 - 1); // bien: đây là kết quả của buổi học thứ 2 về
  String tam2 = tam.substring(d1 + 1, str.length + 1);
  str =
      '$tam1 ${tam[d1].toUpperCase()}$tam2'; // bien: art: dart basics (phần 1)...

  int d2 = str.indexOf('d');
  String tam3 = str.substring(0, d2 - 1);
  String tam4 = str.substring(d2, d2 + 10);
  String tam5 = str.substring(d2 + 11, str.length);
  str = '$tam3 ${tam4.toUpperCase()}$tam5';

  str = str.replaceAll(' của', '');
  str = str.replaceAll('...', '');
  log(str);
  // String tams = 'Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)';
  // log('${str.length == tams.length}');
}
