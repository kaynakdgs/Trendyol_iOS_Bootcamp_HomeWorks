//
//  Yolcu.swift
//  BiletYolcuHomeWork
//
//  Created by Doğuş  Kaynak on 5.05.2021.
//

import Foundation

struct Yolcu {
    var isim: String = "İsimsiz"
    var soyad: String = "İsimsiz"
    let id: Int = 0
    
    func yazdir() {
        print("\(isim)-\(soyad)-\(id)")
    }
}
