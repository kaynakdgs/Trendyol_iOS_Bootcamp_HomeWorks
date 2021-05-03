//
//  UserViewController.swift
//  GetirHomeWork
//
//  Created by Doğuş  Kaynak on 3.05.2021.
//

import UIKit

class UserViewController: UIViewController, LocationDelegateProtocol  {
    
    @IBOutlet weak var showAddressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func sendLocationUserVc(userLocation: String) {
        self.showAddressLabel.text = userLocation
    }
    
    @IBAction func openMapButton(_ sender: UIButton) {
        
        let mapViewVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapScreen") as! ViewController
        mapViewVc.delegate = self
        navigationController?.pushViewController(mapViewVc, animated: true)
    }
    
}
