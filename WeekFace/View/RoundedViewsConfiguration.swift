//
//  RoundedViewsConfiguration.swift
//  Loading Hapiness
//
//  Created by Sergio Gonzalez Cristobal on 5/3/23.
//

import UIKit

class RoundedViewsConfiguration: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderWidth = 5
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
}
