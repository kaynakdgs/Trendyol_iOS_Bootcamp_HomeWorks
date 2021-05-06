import Foundation

struct Guitar {
    static let owner = "Doğuş Kaynak"
    
    var brand: String
    var count: Int
}

let fender = Guitar(brand: "Fender", count: 2)
let gibson = Guitar(brand: "Gibson", count: 1)
let Yamaha = Guitar(brand: "Yamaha", count: 2)

Guitar.owner

//MARK: Static: Bütün objelerde geçerli property demektir. Yani ürettiğimiz her gitarın("Instances") "owner" ı "Doğuş Kaynak" olacaktır. Sadece type("Guitar") "owner" a sahiptir. 
