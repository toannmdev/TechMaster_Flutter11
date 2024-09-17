import 'dart:developer' as developer;

import 'is_prime/is_prime.dart';

void main() {
  const input = 100;

  [
    Cach1(),
    Cach2(),
    Cach3(),
  ].getPrimesFromN(input);
}

extension MutipleWayToCheckIsPrimeExt on 
List<MutipleWayToCheckIsPrime> {
  void getPrimesFromN(int n) {
    for (var checkIsPrimeInstance in this) {
      checkIsPrimeInstance.getPrimesFromN(n);
    }
  }
}

abstract class MutipleWayToCheckIsPrime {
  int numberOfRunningTime = 0;

  void getPrimesFromN(int n) {
    final List<int> primeNumbers = [];

    for (int i = 0; i < n; i++) {
      if (isPrime(i)) {
        primeNumbers.add(i);
      }

      numberOfRunningTime++;
    }

    developer.log(
      '''$this numberOfRunningTime -> $numberOfRunningTime,'''
      ''' primeNumbers: $primeNumbers''',
    );
  }

  bool isPrime(int n);
}
