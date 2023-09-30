//
//  ConfigureNavigationBar.swift
//  BootcampCloneDesignAssignment
//
//  Created by furkan sakız on 27.09.2023.
//

import Foundation
import UIKit

class ConfigureNavigationBar {
    
    func configureNavTitleLogo(title: String,imageName: String) -> UIView {
        
        let titleView = UIView()
        
        let label = UILabel()
        label.text = title
        label.sizeToFit()
        
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        
        let imageAspect = image.image!.size.width / image.image!.size.height
        
        let imageWidth = label.frame.size.height * imageAspect
        let imageHeight = label.frame.size.height
        
        
          let labelX = image.frame.origin.x + image.frame.size.width + 32

          label.frame = CGRect(x: labelX, y: 0, width: label.frame.size.width, height: label.frame.size.height)
        
        image.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        
        titleView.addSubview(label)
        titleView.addSubview(image)
        
        titleView.sizeToFit()
        
        return titleView
    }
    
    func configureNavLogo(imageName: String) -> UIView {
        
        let logoView = UIView()
        let image = UIImageView()
        
        image.image = UIImage(named: imageName)
        
        image.frame = CGRect(x: -48, y: -8, width: 45, height: 30)
        
        logoView.addSubview(image)
        
        logoView.sizeToFit()
        
        return logoView
    }
}
