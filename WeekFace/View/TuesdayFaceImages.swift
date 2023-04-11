//
//  TuesdayFaceImages.swift
//  WeekFace
//
//  Created by Sergio Gonzalez Cristobal on 21/3/23.
//

import UIKit

class TuesdayFaceImages {
    
    let animationImages = [UIImage(named: "TuesdayFace01")!, UIImage(named: "TuesdayFace02")!, UIImage(named: "TuesdayFace03")!, UIImage(named: "TuesdayFace04")!]
    
    func startAnimating(viewForShow: RoundedViewsConfiguration) {
        viewForShow.animationImages = animationImages
        viewForShow.animationDuration = 0.5
        viewForShow.startAnimating()
    }
    
}
