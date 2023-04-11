//
//  IdleFaceImages.swift
//  WeekFace
//
//  Created by Sergio Gonzalez Cristobal on 14/3/23.
//

import UIKit

class IdleFaceImages {
    
    let animationImages = [UIImage(named: "FaceIdle_01")!, UIImage(named: "FaceIdle_02")!, UIImage(named: "FaceIdle_03")!, UIImage(named: "FaceIdle_04")!]
    
    func startAnimating(viewForShow: RoundedViewsConfiguration) {
        viewForShow.animationImages = animationImages
        viewForShow.animationDuration = 0.5
        viewForShow.startAnimating()
    }
    
}
