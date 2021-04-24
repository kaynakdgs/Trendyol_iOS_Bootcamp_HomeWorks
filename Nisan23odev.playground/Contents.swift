import Foundation

//Oyun için dönme açıları ile ilgili bir switch case yapısı deneyiniz. ÖDEV

enum Direction {
    case right
    case left
    case top
    case down
}

func move(direction: Direction) {
    switch direction {
    case .right:
        print("My Warrior is facing the enemy!")
    case .left:
        print("My Warrior sees the friendly Warrior.")
    case .top:
        print("My Warrior sees Glorious Sky...")
    case .down:
        print("My Warrior never looks down!")
    }
}

move(direction: .left)


//ÖDEV: if let - guard let kullanım tercihlerini neye göre belirlersiniz?

/**
 -use "if let" if you just want to unwrap some optionals,
 but prefer "guard let" if you’re specifically checking that conditions are correct before continuing.
 
 -guard işlevin geri kalanının iç içe geçmesini gerektirmeden erken dönüş sağlamak için kullanılır.
 */


