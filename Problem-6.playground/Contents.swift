import Foundation

var sumOfSquares = 0
for i in (1...100) {
    sumOfSquares += i * i
}

var squareOfSums = 0
for i in (1...100) {
    squareOfSums += i
}

squareOfSums = squareOfSums * squareOfSums

print(squareOfSums - sumOfSquares)
