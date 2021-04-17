
var a = 1
var b = 2
var sum = b

while (b <= 4000000) {
    let tempNumber = a
    a = b
    b = tempNumber + b
    
    if (b%2 == 0) {
        sum += b
    }
}

print(sum)
