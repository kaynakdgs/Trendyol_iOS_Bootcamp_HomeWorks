import Foundation

func divisible(number: Int) -> Bool {
    for i in (11...20) {
        if number % i != 0 {
            return false
        }
    }
    return true
}

var smallestNumber = 20

while true {
    if divisible(number: smallestNumber) {
        break
    } else {
        smallestNumber += 20
    }
}

print(smallestNumber)
