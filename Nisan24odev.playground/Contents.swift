import Foundation

//MARK: ODEV: Girilen sayının asal olup olmadığını bulan bir extension yazınız.

extension Int {
    var isPrime: Bool {
        guard self > 1 else {
            return false
        }
        
        for num in 2..<self {
            if self % num == 0 {
                return false
            }
        }
        return true
    }
}

47.isPrime()


//MARK: ODEV: İki Parametreli ve Farklı tipli bir generic örneği yapınız.

func multipleValues<T, S>(_ first: T, _ second: S) -> (T,S) {
    return (first,second)
}

let result = multipleValues("a", 3)
print(result)
