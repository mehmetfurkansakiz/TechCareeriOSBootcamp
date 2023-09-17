//
//  SayfaY.swift
//  BootcampNavigationAssignment
//
//  Created by furkan sakız on 18.09.2023.
//

import UIKit

class SayfaY: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func geriButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
