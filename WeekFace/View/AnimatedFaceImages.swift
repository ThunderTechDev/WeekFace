//
//  AnimatedFaceImages.swift
//  WeekFace
//
//  Created by Sergio Gonzalez Cristobal on 13/3/23.
//

import UIKit

class AnimatedFaceImages: UIView {
    
    var animationImages: [UIImage] = [UIImage(named: "FaceIdle_01")!, UIImage(named: "FaceIdle_02")!, UIImage(named: "FaceIdle_03")!, UIImage(named: "FaceIdle_04")!]
    
    private var animationDuration : TimeInterval = 1
    private var animationRepeatCount = 0
    
    
    func startAnimating() {
            guard !animationImages.isEmpty else { return }
            
            let animation = CABasicAnimation(keyPath: "contents")
            animation.duration = animationDuration
            animation.repeatCount = Float(animationRepeatCount)
            animation.autoreverses = false
            animation.isRemovedOnCompletion = false
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.fromValue = animationImages.first?.cgImage
            animation.toValue = animationImages.last?.cgImage
            animationImages.last?.draw(in: bounds)
            
            layer.add(animation, forKey: "animatedImage")
        }
    
    func stopAnimating() {
           layer.removeAnimation(forKey: "animatedImage")
       }
    
}
