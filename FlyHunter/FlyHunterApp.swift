//
//  TapGameApp.swift
//  TapGame
//
//  Created by Igor Kononov on 25.05.2023.
//

import SwiftUI

@main
struct TapGameApp: App {
    var body: some Scene {
        WindowGroup {
            FlyHunter(viewModel: FlyHunterViewModel(), firstOpenViewModel: FirstOpenViewModel())
        }
    }
}
