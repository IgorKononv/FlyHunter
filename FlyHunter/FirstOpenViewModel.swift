//
//  FirstOpenViewModel.swift
//  TapGame
//
//  Created by Igor Kononov on 26.05.2023.
//

import SwiftUI

final class FirstOpenViewModel: ObservableObject {
    @Published var firstOpen = false
    
    init() {
        firstOpen = UserDefaultsManager.shared.isFirstOpen
    }
    
    func dismissInstruction() {
        firstOpen = true
        UserDefaultsManager.shared.dismissInstruction()
    }
}
