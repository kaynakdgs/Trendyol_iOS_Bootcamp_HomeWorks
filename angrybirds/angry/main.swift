//
//  main.swift
//  angry
//
//  Created by Doğuş  Kaynak on 29.04.2021.
//

import Foundation

var myGame = Game()

myGame.enterName(name: "Doğuş")
myGame.setBottleLocation(d: 346.0,delta: 0.6)
myGame.setRange(teta: 45, v: 70)

myGame.shot()
myGame.showStats()
