import 'dart:math';

import '../btvn_is_prime.dart';

final class Cach1 extends MutipleWayToCheckIsPrime {
  @override
  bool isPrime(int n) {
    if (n < 2) {
      return false; // <=1 is not prime
    }

    int max = sqrt(n).toInt(); // n / i

    for (var i = 2; i <= max; ++i) {
      if (n % i == 0) {
        return false;
      }

      numberOfRunningTime++;
    }

    return true;
  }
}
