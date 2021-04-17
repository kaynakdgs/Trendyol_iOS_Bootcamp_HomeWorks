

import Foundation

var number = 0

for i in 1..<1000 {
    if (i%3 == 0) || (i%5 == 0) {
        number = number + i
    }
}

print(number)
