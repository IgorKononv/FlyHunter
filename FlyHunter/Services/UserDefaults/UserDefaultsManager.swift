//
//  UserDefaultsManager.swift
//  TapGame
//
//  Created by Igor Kononov on 26.05.2023.
//

import Foundation


final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    let userDefaults = UserDefaults.standard
    
    var isFirstOpen: Bool {
        userDefaults.isFirstOpen ?? false
    }
    
    func dismissInstruction() {
        userDefaults.isFirstOpen = true
    }
}
