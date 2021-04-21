/**
 ÖDEVLER
 1-Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun stringler olsun. Bu stringlerin içinde bazı harflerin tekrar edeceğini düşünün. Mesela 'a' harfi 20 farklı yerde geçiyor. Bir fonksiyon ile verilen parametre değerinden eşit ve daha fazla bulunun harfler silinecektir. Sonra geriye kalan string ekrana yazdırılacaktır.
 
 Örnek string: "aaba kouq bux"
 Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazmalı
 Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
 Tekrar sayısı 4 verildiğinde : hiç bir harf silinmemeli aynı stringi yazmalı
 
 String ve tekrar sayısını parametre olarak alsın.
 */

import UIKit

func countSting(string: String, wordCount: Int) -> String {
    var str = string
    var newString = ""
    var count = [Character:Int]()
    let characters = Array(string)
    
    for i in characters {
        if count[i] == nil {
            count[i] = 1
        } else {
            count[i]! += 1
        }
    }
    
    count.forEach { (key,value) in
        if key != " " && value >= wordCount {
            newString = str.replacingOccurrences(of: String(key), with: "")
            str = newString
        }
    }
    
    if str.first == " " {
        str.removeFirst()
    }
    
    return str
}

let result = countSting(string: "aaba kouq bux", wordCount: 2)
print(result)

