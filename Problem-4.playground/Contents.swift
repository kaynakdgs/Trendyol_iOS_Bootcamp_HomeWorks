
var answer = 0
var value = 0
var string = ""

for firstNumber in (100...999).reversed() {
    for secondNumber in (100...firstNumber).reversed() {
        value = firstNumber * secondNumber
        string = String(value)
        if string == String(string.reversed()) && value > answer {
            answer = value
        }
    }
}

print(answer)
