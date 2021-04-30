import Foundation

/**
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the 10 001st prime number?
 */
func prime(n: Int) -> Int {
    var primes = [2]
    var number = 3

    while(primes.count < n) {
        if(isPrime(number: number)) {
            primes.append(number)
        }
            number += 2
        }
    return primes.popLast()!
}


func isPrime(number: Int) -> Bool {
    guard number > 1 else {
        return false
    }
    
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

prime(n: 10001)
