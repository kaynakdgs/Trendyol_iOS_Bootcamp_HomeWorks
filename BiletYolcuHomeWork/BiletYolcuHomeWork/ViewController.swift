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

    @IBOutlet weak var ticketNumberLabel: UILabel!
    
    var bilet = Bilet()
    var tarih = Tarih()
    var saat = Saat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func getSeat(_ sender: Any) {
        
        let seatVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BusVc") as! BusViewController
        let yolcu = Yolcu.init(isim: isimTextFiled.text ?? "",
                               soyad: soyisimTextField.text ?? "")
        bilet.yolcu = yolcu
        bilet.tarih = tarih
        bilet.saat = saat
        seatVc.bilet = bilet
        seatVc.bilet.nereden = neredenText.text ?? ""
        seatVc.bilet.nereye = nereyeText.text ?? ""
        
        navigationController?.pushViewController(seatVc, animated: true)
    }
    
    @IBAction func ticketStepper(_ sender: UIStepper) {
        ticketNumberLabel.text = String(Int(sender.value))
        bilet.koltukSayisi = Int(sender.value)
    }
    
    @IBAction func datePickerSelected(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let gun = dateFormatter.string(from: sender.date)
        dateFormatter.dateFormat = "MM"
        let ay = dateFormatter.string(from: sender.date)
        dateFormatter.dateFormat = "yyyy"
        let yil = dateFormatter.string(from: sender.date)
        tarih = Tarih.init(gun: gun, ay: ay, yil: yil)
        
        dateFormatter.dateFormat = "HH"
        let hour = dateFormatter.string(from: sender.date)
        dateFormatter.dateFormat = "mm"
        let minute = dateFormatter.string(from: sender.date)
        saat = Saat.init(saat: hour, dakika: minute)
    }
    
}

//MARK: Hide Navigation Controller
extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
