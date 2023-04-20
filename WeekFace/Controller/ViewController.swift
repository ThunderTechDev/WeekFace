//
//  ViewController.swift
//  WeekFace
//
//  Created by Sergio Gonzalez Cristobal on 28/2/23.
// .

import UIKit

class ViewController: UIViewController {

    

    let weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Weekend!"]
    var currentDay = 0
    var modelAnimations = ModelAnimations()
    var currentAnimation = 0
    var animationBeforeTap = 0
    var centerImageAlreadyTapped = false
    var isTheCenterImageRecentlyTapped = false

    
    
    
    @IBOutlet weak var screenAnimationView: RoundedViewsConfiguration!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var plusDayButton: RoundedButtonConfiguration!
    @IBOutlet weak var plusDayButtonIPad: RoundedButtonConfiguration!
    @IBOutlet weak var volumeIcon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(animateCenterFace))
        currentDayLabel.text = weekDays[currentDay]
        modelAnimations.startAnimation(named: "Monday", shouldPlaySound: true, in: screenAnimationView)
        
        screenAnimationView.addGestureRecognizer(tapGestureRecognizer)
        screenAnimationView.isUserInteractionEnabled = true

    }

    @IBAction func volumeIconAction(_ sender: UIButton) {
        
        AppSettings.shared.playSoundEnabled = !AppSettings.shared.playSoundEnabled
        modelAnimations.triggerHapticFeedback()
        
        if AppSettings.shared.playSoundEnabled {
            sender.setImage(UIImage(systemName: "speaker.wave.1"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "speaker.slash"), for: .normal)
        }
        
        
        
    }
    @IBAction func plusDayAction(_ sender: RoundedButtonConfiguration) {
        
        screenAnimationView.stopAnimating()
        
        if currentAnimation != 5 {
            
            if currentAnimation < modelAnimations.allAnimations.count - 1 && currentDay < modelAnimations.allAnimations.count - 1{
                currentDay += 1
                currentDayLabel.text = weekDays[currentDay]
                
            }
            
            if currentDay == 4 {
                plusDayButton.isEnabled = false
                plusDayButtonIPad.isEnabled = false
                
            }
        } else {
            currentAnimation = animationBeforeTap
        }
            
        switch currentDay {
        case 1:
            currentAnimation = 1
            if isTheCenterImageRecentlyTapped == true {
                modelAnimations.startAnimation(named: "Tuesday", shouldPlaySound: false, in: screenAnimationView)
                isTheCenterImageRecentlyTapped = false
            } else {
                modelAnimations.startAnimation(named: "Tuesday", shouldPlaySound: true, in: screenAnimationView)
            }
        case 2:
            currentAnimation = 2
            if isTheCenterImageRecentlyTapped == true {
                modelAnimations.startAnimation(named: "Wednesday", shouldPlaySound: false, in: screenAnimationView)
                isTheCenterImageRecentlyTapped = false
            } else {
                modelAnimations.startAnimation(named: "Wednesday", shouldPlaySound: true, in: screenAnimationView)
            }
        case 3:
            currentAnimation = 3
            if isTheCenterImageRecentlyTapped == true {
                modelAnimations.startAnimation(named: "Thursday", shouldPlaySound: false, in: screenAnimationView)
                isTheCenterImageRecentlyTapped = false
            } else {
                modelAnimations.startAnimation(named: "Thursday", shouldPlaySound: true, in: screenAnimationView)
            }
        case 4:
            currentAnimation = 4
            if isTheCenterImageRecentlyTapped == true {
                modelAnimations.startAnimation(named: "Weekend", shouldPlaySound: false, in: screenAnimationView)
                isTheCenterImageRecentlyTapped = false
            } else {
                modelAnimations.startAnimation(named: "Weekend", shouldPlaySound: true, in: screenAnimationView)
            }
        default:
            currentAnimation = 0
            if isTheCenterImageRecentlyTapped == true {
                modelAnimations.startAnimation(named: "Monday", shouldPlaySound: false, in: screenAnimationView)
                isTheCenterImageRecentlyTapped = false
            } else {
                modelAnimations.startAnimation(named: "Monday", shouldPlaySound: true, in: screenAnimationView)
            }
        }
    }
    
    @IBAction func returnToMondayAction(_ sender: RoundedButtonConfiguration) {
        currentDay = 0
        currentAnimation = 0
        modelAnimations.startAnimation(named: "Monday", shouldPlaySound: true, in: screenAnimationView)
        currentDayLabel.text = weekDays[currentDay]
        plusDayButton.isEnabled = true
        plusDayButtonIPad.isEnabled = true
        
    }
    
   
    
    
    @objc func animateCenterFace() {
        
        animationBeforeTap = currentAnimation
        currentAnimation = 5
        
        screenAnimationView.animationDuration = 0.5
        modelAnimations.startAnimation(named: "TapFace", shouldPlaySound: true, in: screenAnimationView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
           
            if self.centerImageAlreadyTapped == false {
                self.plusDayAction(self.plusDayButton)
                self.centerImageAlreadyTapped = true
            }
        }
        centerImageAlreadyTapped = false
        isTheCenterImageRecentlyTapped = true
       
    }
    
    
    
    
    
    
}

