//
//  CustomTabBarVc.swift
//  TabbarButton_HomeWork
//
//  Created by Doğuş  Kaynak on 12.05.2021.
//

import UIKit

class CustomTabBarVc: UITabBarController, UITabBarControllerDelegate {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 1
        tabBarConfig()
        setupMiddleButton()
    }
    
    private func tabBarConfig() {
        self.tabBar.barTintColor = .orange
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .black
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width/2) - 30, y: -25, width: 60, height: 60))
        middleButton.setBackgroundImage(UIImage(named: "info"), for: .normal)
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(middleButtonAction), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    
    @objc func middleButtonAction(sender: UIButton) {
        self.selectedIndex = 1
    }
}
