//
//  CustomTabBarViewController.swift
//  BootcampCloneDesignAssignment
//
//  Created by furkan sakız on 30.09.2023.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    let button = UIButton.init(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.tintColor = UIColor.white
        
        button.frame = CGRect(x: 100, y: 0, width: 44, height: 44)
        
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        
        button.backgroundColor = UIColor(named: "letgoColor")
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.cgColor
        self.view.insertSubview(button, aboveSubview: self.tabBar)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect.init(x: self.tabBar.center.x - 32, y: self.view.bounds.height - 115, width: 64, height: 64)
        button.layer.cornerRadius = 32
    }
}
