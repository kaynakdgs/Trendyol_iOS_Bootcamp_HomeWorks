//
//  NotificationSenderVC.swift
//  Week-3_Part-1
//
//  Created by Kerim Caglar on 1.05.2021.
//

import UIKit

class NotificationSenderVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var notificationData: [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func sendNotificationBtn(_ sender: Any) {
        notificationData["name"] = nameTextField.text
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: notificationData)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Notification sender daki mesajı kullanıcıdan alınız.. (DONE)
}
