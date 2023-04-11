//
//  ModelAnimations.swift
//  WeekFace
//
//  Created by Sergio Gonzalez Cristobal on 21/3/23.
//

import UIKit
import AVFoundation

class ModelAnimations {
    struct Animation {
        let images: [UIImage]
        let name: String
        let soundFileName: String
    }
    
    let animationMonday = Animation(images: [UIImage(named: "MondayFace01")!, UIImage(named: "MondayFace02")!, UIImage(named: "MondayFace03")!, UIImage(named: "MondayFace04")!], name: "Monday", soundFileName: "MondaySound")
    let animationTuesday = Animation(images: [UIImage(named: "TuesdayFace01")!, UIImage(named: "TuesdayFace02")!, UIImage(named: "TuesdayFace03")!, UIImage(named: "TuesdayFace04")!], name: "Tuesday", soundFileName: "TuesdaySound")
    let animationWednesday = Animation(images: [UIImage(named: "WednesdayFace01")!, UIImage(named: "WednesdayFace02")!, UIImage(named: "WednesdayFace03")!, UIImage(named: "WednesdayFace04")!], name: "Wednesday", soundFileName: "WednesdaySound")
    let animationThursday = Animation(images: [UIImage(named: "ThursdayFace01")!, UIImage(named: "ThursdayFace02")!, UIImage(named: "ThursdayFace03")!, UIImage(named: "ThursdayFace04")!], name: "Thursday", soundFileName: "ThursdaySound")
    let animationWeekend = Animation(images: [UIImage(named: "WeekendFace01")!, UIImage(named: "WeekendFace02")!, UIImage(named: "WeekendFace03")!, UIImage(named: "WeekendFace04")!], name: "Weekend", soundFileName: "WeekendSound")
    let animationTapFace = Animation(images: [UIImage(named: "TapFace01")!, UIImage(named: "TapFace02")!, UIImage(named: "TapFace05")!, UIImage(named: "TapFace06")!, UIImage(named: "TapFace03")!, UIImage(named: "TapFace04")!], name: "TapFace", soundFileName: "TapFaceSound")
    
    
    public let allAnimations: [Animation]
    
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        allAnimations = [animationMonday, animationTuesday, animationWednesday, animationThursday, animationWeekend, animationTapFace]
    }
    
    func playSound(soundFileName: String) {
        
        if AppSettings.shared.playSoundEnabled {
            
            if let dataAsset = NSDataAsset(name: soundFileName) {
                do {
                    audioPlayer = try AVAudioPlayer(data: dataAsset.data)
                    audioPlayer?.play()
                } catch {
                    print("Error al reproducir el sonido: \(error.localizedDescription)")
                }
            } else {
                print("Error al cargar el archivo de sonido: \(soundFileName)")
            }
        } else {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0
        }
       
    }
    
    func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        //print("Respuesta háptica generada")
    }
    
    func startAnimation(named animationName: String, shouldPlaySound: Bool, in imageView: UIImageView) {
        if let animation = allAnimations.first(where: { $0.name == animationName }) {
            imageView.animationImages = animation.images
            imageView.animationDuration = 0.5
            imageView.animationRepeatCount = 0
            imageView.startAnimating()
            
            if shouldPlaySound == true {
                playSound(soundFileName: animation.soundFileName)
                triggerHapticFeedback()
            }
            
        }
    }
}




