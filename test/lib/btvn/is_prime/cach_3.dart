import '../btvn_is_prime.dart';

final class Cach3 extends MutipleWayToCheckIsPrime {
  @override
  bool isPrime(int n) {
    bool isPrime = true;

    for (int j = 2; j <= n / 2; j++) {
      if (n % j == 0) {
        return true;
      }
      numberOfRunningTime++;
    }

    if (isPrime) {
      return true;
    }
  }
}
