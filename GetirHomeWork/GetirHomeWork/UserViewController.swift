//
//  UserViewController.swift
//  GetirHomeWork
//
//  Created by Doğuş  Kaynak on 3.05.2021.
//

import UIKit

final class UserViewController: UIViewController {
    
    @IBOutlet weak private var showAddressLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: Location Protocol
extension UserViewController: LocationDelegateProtocol {
    func sendLocationUserVc(userLocation: String) {
        self.showAddressLabel.text = userLocation
    }
}

// MARK: Button Actions
extension UserViewController {
    @IBAction func openMapButton(_ sender: UIButton) {
        
        let mapViewVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapScreen") as! ViewController
        mapViewVc.delegate = self
        navigationController?.pushViewController(mapViewVc, animated: true)
    }
}
