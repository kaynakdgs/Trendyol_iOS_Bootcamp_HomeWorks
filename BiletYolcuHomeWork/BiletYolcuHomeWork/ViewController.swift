//
//  ViewController.swift
//  BiletYolcuHomeWork
//
//  Created by Doğuş  Kaynak on 5.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var isimTextFiled: UITextField!
    @IBOutlet weak var soyisimTextField: UITextField!
    @IBOutlet weak var neredenText: UITextField!
    @IBOutlet weak var nereyeText: UITextField!
    @IBOutlet weak var datePicket: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tarih = Tarih()
        let saat = Saat()
        var yolcu = Yolcu()
        yolcu.isim = "Doğuş"
        yolcu.soyad = "Kaynak"
                
        var bilet = Bilet(yolcu: yolcu,
                          tarih: tarih,
                          saat: saat)
        
        bilet.koltukNoEkle(koltukNo: 10)
        bilet.koltukNoEkle(koltukNo: 11)
        bilet.koltukNoEkle(koltukNo: 12)
        bilet.koltukNoEkle(koltukNo: 13)
        bilet.koltukNoEkle(koltukNo: 14)
        
        bilet.biletSatınAl()
        
    }
    
    @IBAction func getTicket(_ sender: Any) {
       
    }
    
}

