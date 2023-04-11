//
//  RoundedButtonConfiguration.swift
//  Loading Hapiness
//
//  Created by Sergio Gonzalez Cristobal on 5/3/23.
//

import UIKit

class RoundedButtonConfiguration: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
}
