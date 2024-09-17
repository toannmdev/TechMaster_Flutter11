import '../btvn_is_prime.dart';

final class Cach2 extends MutipleWayToCheckIsPrime {
  @override
  bool isPrime(int n) {
    if (n < 2) {
      return false; //<=1 is not prime
    }

    if (n == 2 || n == 3) {
      return true;
    }

    if (n % 2 == 0) {
      return false;
    }

    // int sqrtNum = sqrt(num).toInt();
    for (int i = 3; i * i <= n; i += 2) {
      if (n % i == 0) {
        return false;
      }

      numberOfRunningTime++;
    }
    
    return true;
  }
}
