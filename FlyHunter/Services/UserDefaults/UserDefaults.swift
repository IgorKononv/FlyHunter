//
//  UserDefaults.swift
//  TapGame
//
//  Created by Igor Kononov on 26.05.2023.
//

import Foundation


private let isFirstOpenKey = "IS_FIRST_OPEN_KEY"

extension UserDefaults {
    var isFirstOpen: Bool? {
        get {
            bool(forKey: isFirstOpenKey)
        }
        set {
            set(newValue, forKey: isFirstOpenKey)
        }
    }
}
