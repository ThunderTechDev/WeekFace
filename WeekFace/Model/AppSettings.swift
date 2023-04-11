//
//  AppSettings.swift
//  WeekFace
//
//  Created by Sergio Gonzalez Cristobal on 5/4/23.
//

import Foundation

class AppSettings {
    
    static let shared = AppSettings()
    
    var playSoundEnabled: Bool = true
    
    private init() {}
    
    
}
