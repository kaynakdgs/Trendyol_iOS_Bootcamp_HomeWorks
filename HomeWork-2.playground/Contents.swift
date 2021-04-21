/**
 2-Elimizde uzun bir cümle olsun, bazı kelimelerin tekrar edeceği bir cümle düşünün. İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmanız..
 string = "merhaba nasılsınız. iyiyim siz nasılsınız. bende iyiyim."
 her kelimenin sayısını yazacağız.
 */

import UIKit

func wordCalculator (string: String) {
    let sentence = string.split(separator: " ")
    var count = [String:Int]()
    
    for i in sentence {
        count[String(i)] = (count[String(i)] ?? 0) + 1
    }
    print(count)
}

wordCalculator(string: "merhaba naber iyi iyi naber iyi selam")

