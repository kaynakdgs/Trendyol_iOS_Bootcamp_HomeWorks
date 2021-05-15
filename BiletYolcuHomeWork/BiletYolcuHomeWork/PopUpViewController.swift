//
//  PopUpViewController.swift
//  BiletYolcuHomeWork
//
//  Created by Doğuş  Kaynak on 10.05.2021.
//

import UIKit

class PopUpViewController: UIViewController {
    
    private let ticketButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 400, width: 140, height: 40))
        button.setTitle("Yeni koltuk seç", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var yolcuLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var saatLabel: UILabel!
    @IBOutlet weak var koltukLabel: UILabel!
    @IBOutlet weak var istikametLabel: UILabel!
    
    
    var bilet = Bilet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.addSubview(ticketButton)
        labelConfig()
        setupView()
        moveIn()
        biletDetay()
    }
    
    private func biletDetay() {
        yolcuLabel.text = "\(bilet.yolcu?.isim ?? "") \(bilet.yolcu?.soyad ?? "")"
        tarihLabel.text = "\(bilet.tarih?.gun ?? "") / \(bilet.tarih?.ay ?? "") / \(bilet.tarih?.yil ?? "")"
        istikametLabel.text = "\(bilet.nereden ?? "") -> \(bilet.nereye ?? "")"
        saatLabel.text = "\(bilet.saat?.saat ?? "") : \(bilet.saat?.dakika ?? "")"
        koltukLabel.text = "\("Koltuk no: \(bilet.koltuk)")"
    }
    
    @objc func buttonAction(sender: UIButton!) {
        moveOut()
    }
    
    private func labelConfig() {
        yolcuLabel.layer.cornerRadius = 10
        yolcuLabel.layer.masksToBounds = true
        tarihLabel.layer.cornerRadius = 10
        tarihLabel.layer.masksToBounds = true
        istikametLabel.layer.cornerRadius = 10
        istikametLabel.layer.masksToBounds = true
        saatLabel.layer.cornerRadius = 10
        saatLabel.layer.masksToBounds = true
        koltukLabel.layer.cornerRadius = 10
        koltukLabel.layer.masksToBounds = true
    }
    
    private func moveIn() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0

        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }

    private func moveOut() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }) { _ in
            self.view.removeFromSuperview()
            }
    }
    
    private func setupView() {
        popUpView.layer.cornerRadius = 14
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
}
