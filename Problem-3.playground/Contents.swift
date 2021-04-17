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

