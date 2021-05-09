//
//  Bilet.swift
//  BiletYolcuHomeWork
//
//  Created by Doğuş  Kaynak on 5.05.2021.
//

import UIKit

struct Bilet {
    let yolcu: Yolcu?
    let tarih: Tarih?
    let saat: Saat?
    var koltuk: [Int] = []
    var koltukSayisi: Int
    
    var seatList: [Int] = []
    
    init(yolcu: Yolcu? = nil,
         tarih: Tarih? = nil,
         saat: Saat? = nil) {
        self.yolcu = yolcu
        self.tarih = tarih
        self.saat = saat
        self.koltukSayisi = 0
    }
    
    mutating func koltukNoEkle(koltukNo: Int) {
        if koltukNo >= 1 && koltukNo <= 45 {
            if seatList.contains(koltukNo) {
                print("Aynı koltuk numarasını(\(koltukNo)) seçtiniz.")
            } else {
                seatList.append(koltukNo)
            }
        } else {
            print("Yanlış koltuk numarası! \(koltukNo) numaralı koltuk bulunmamaktadır.")
        }
    }
    
    mutating func koltukAyır() {
        guard koltukSayisi == 0 else { return }
        koltukSayisi = seatList.count
        koltuk.append(contentsOf: seatList)
    }
       
    mutating func biletSatınAl() {
        if seatList.count <= 5 {
            if karsilastir(seats: seatList) {
                print("Daha önce satın alınmış koltuk seçtiniz.")
            }else {
                koltukAyır()
                biletYazdir()
            }
        } else {
            print("5 ten fazla seçim yapamazsınız.")
        }
    }
    
    private func karsilastir(seats: [Int]) -> Bool {
        let commonSeats = koltuk.filter { seats.contains($0) }
        if commonSeats.isEmpty {
            return false
        }else{
            return true
        }
    }
    
    private func biletYazdir() {
        guard let yolcu = yolcu,
              let tarih = tarih,
              let saat = saat else { return }
        yolcu.yazdir()
        tarih.yazdir()
        saat.yazdir()
        print(koltuk)
    }
}

