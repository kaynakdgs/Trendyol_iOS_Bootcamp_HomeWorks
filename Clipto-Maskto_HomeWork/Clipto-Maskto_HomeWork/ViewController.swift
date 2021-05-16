//
//  ViewController.swift
//  Clipto-Maskto_HomeWork
//
//  Created by Doğuş  Kaynak on 12.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBlue: UIView!
    @IBOutlet weak var viewGreen: UIView!
    @IBOutlet weak var viewRed: UIView!
    @IBOutlet weak var viewOrange: UIView!
    @IBOutlet weak var viewBlueBlack: UIView!
    @IBOutlet weak var viewOrangeBlack: UIView!
    @IBOutlet weak var viewRedBlack: UIView!
    @IBOutlet weak var viewGreenBlack: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBlue.layer.cornerRadius = 30
        viewBlue.layer.shadowColor = UIColor.black.cgColor
        viewBlue.layer.shadowOpacity = 1
        viewBlue.layer.shadowOffset = .zero
        viewBlue.layer.shadowRadius = 10

        viewBlueBlack.layer.cornerRadius = 30
        viewBlueBlack.layer.shadowColor = UIColor.black.cgColor
        viewBlueBlack.layer.shadowOpacity = 1
        viewBlueBlack.layer.shadowOffset = .zero
        viewBlueBlack.layer.shadowRadius = 10
        
        viewBlue.clipsToBounds = true
        
        viewOrange.layer.cornerRadius = 30
        viewOrange.layer.shadowColor = UIColor.black.cgColor
        viewOrange.layer.shadowOpacity = 1
        viewOrange.layer.shadowOffset = .zero
        viewOrange.layer.shadowRadius = 10
        
        viewOrangeBlack.layer.cornerRadius = 30
        viewOrangeBlack.layer.shadowColor = UIColor.black.cgColor
        viewOrangeBlack.layer.shadowOpacity = 1
        viewOrangeBlack.layer.shadowOffset = .zero
        viewOrangeBlack.layer.shadowRadius = 10
        
        viewOrange.layer.masksToBounds = true
        
        viewRedBlack.layer.cornerRadius = 30
        viewRedBlack.layer.shadowColor = UIColor.black.cgColor
        viewRedBlack.layer.shadowOpacity = 1
        viewRedBlack.layer.shadowOffset = .zero
        viewRedBlack.layer.shadowRadius = 10
        viewRed.layer.masksToBounds = false

        viewGreenBlack.layer.cornerRadius = 30
        viewGreenBlack.layer.shadowColor = UIColor.black.cgColor
        viewGreenBlack.layer.shadowOpacity = 1
        viewGreenBlack.layer.shadowOffset = .zero
        viewGreenBlack.layer.shadowRadius = 10
        viewGreen.clipsToBounds = false
    }
}

/**
 - ClipToBounds, subview'ın superView dışında kalan kısmı kesiliyor.
 + viewBlue.clipsToBounds = true dediğimizde, kendi gölge alanını ve subview olan viewBlueBlack'in dışarıda kalan alanını kesiyor.
 - MaskToBounds, View dışında kalan her şey kesiliyor.
 + viewOrange.layer.masksToBounds = true dediğimizde, kendi ve subview'ın gölge alanını ve subview'ın dışarıda kalan kısmını kesiyor.
 
 Note: ViewRed ve ViewGreen false durumlardaki hallerini temsil ediyor.
 */
