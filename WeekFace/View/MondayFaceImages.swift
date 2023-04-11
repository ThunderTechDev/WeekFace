//
//  MondayFaceImages.swift
//  WeekFace
//
//  Created by Sergio Gonzalez Cristobal on 14/3/23.
//

import UIKit

class MondayFaceImages {
    
    let animationImages = [UIImage(named: "MondayFace01")!, UIImage(named: "MondayFace02")!, UIImage(named: "MondayFace03")!, UIImage(named: "MondayFace04")!]
    
    func startAnimating(viewForShow: RoundedViewsConfiguration) {
        viewForShow.animationImages = animationImages
        viewForShow.animationDuration = 0.5
        viewForShow.startAnimating()
    }
    
}
