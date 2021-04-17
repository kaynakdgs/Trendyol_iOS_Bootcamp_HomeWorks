
//import Foundation
//
//class factor {
//    var arrayFactors: [Int]
//
//    init () {
//        self.arrayFactors = []
//    }
//
//    func findFactors(number:Int) -> Int {
//        var i = 2
//        var nextNumber: Int = number
//
//        while nextNumber > 1 {
//            if nextNumber % i == 0 {
//                arrayFactors.append(i)
//                nextNumber = Int(nextNumber / i)
//                while nextNumber % i == 0 {
//                    nextNumber = Int(nextNumber / i)
//                }
//
//                print("factor \(i) leaves number \(nextNumber)")
//            }
//
//            i += 1
//        }
//
//        return arrayFactors.removeLast()
//    }
//}
//
//let myFactor = factor()
//let number = 600851475143
//print("largest prime factor of \(number) is \(myFactor.findFactors(number: number))")


import UIKit


func largestPrimeFactor (givenNum : Int) -> Int {

    var numToFactor = givenNum
    var primeFactor = 2

    while numToFactor > 1 {
        if (numToFactor % primeFactor == 0) {
            numToFactor /= primeFactor
        } else {
            primeFactor += 1
        }

    }
    
    return primeFactor
}

print(largestPrimeFactor(givenNum: 600851475143))

