//
//  Game.swift
//  angry
//
//  Created by Doğuş  Kaynak on 29.04.2021.
//

import Foundation

struct Game {
    
    var player: Player?
    var canonBall: CanonBal?
    var bottle: Bottle?
    
    init(player: Player? = nil, canonBall: CanonBal? = nil, bottle: Bottle? = nil) {
        self.player = player
        self.canonBall = canonBall
        self.bottle = bottle
    }
    
    mutating func enterName(name: String) {
        self.player = Player(name: name)
    }
    
    mutating func setBottleLocation(distance: Double,delta: Double) {
        if distance >= 0.0 && distance <= 1500.0 {
            self.bottle = Bottle(distance: distance, delta: delta)
        } else {
            print("d Değeri 0.0 ile 1500.0 arası olmalıdır.")
            self.bottle = Bottle(distance: 0.0, delta: delta)
        }
    }
    
    mutating func setRange(teta: Double, v: Double) {
        if (teta >= 0.0 && teta <= 90.0) && (v >= 0.0 && v <= 100.0) {
            let r = v * v * sin(teta * Double.pi / 180) / 10
            self.canonBall = CanonBal(range: r)
        } else {
            self.canonBall = CanonBal(range: 0.0)
        }
    }
    
    mutating func shot() {
        guard let bottle = bottle,
              let canonBall = canonBall else { return }
        if canonBall.range >= (bottle.distance - bottle.bottleSpace) && canonBall.range <= (bottle.distance + bottle.bottleSpace) {
            player?.score += 1
            print("Hit!")
        } else {
            player?.score += 0
            print("Miss...")
        }
    }
    
    func showStats() {
        print("Hello \(player?.name ?? "")")
        print("Bottle space = \(bottle?.bottleSpace ?? 0.0)")
        print("Bottle location = \(bottle?.distance ?? 0.0)")
        print("Range = \(canonBall?.range ?? 0.0)")
        print("Score = \(player?.score ?? 0)")
    }
}
    
struct Player {
    var name: String
    var score: Int = 0
}

struct Bottle {
    var distance: Double
    var delta: Double
    
    var bottleSpace: Double {
        guard delta >= 0.1 && delta <= 1.0 else {
            return 0.0
        }
        return delta
    }
}

struct CanonBal {
    var range: Double
}
