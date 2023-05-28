//
//  ContentView.swift
//  TapGame
//
//  Created by Igor Kononov on 25.05.2023.
//

import SwiftUI
import WebKit

struct FlyHunter: View {
    @StateObject var viewModel: FlyHunterViewModel
    @StateObject var firstOpenViewModel: FirstOpenViewModel

    var body: some View {
        ZStack {
            VStack {
                TimerView(viewModel: viewModel)
                Spacer()
                StartButtonView(viewModel: viewModel)
            }
            AimView(viewModel: viewModel)
                .ignoresSafeArea()
            
            FirstOpenView(viewModel: firstOpenViewModel)
        }
        .fullScreenCover(isPresented: $viewModel.showWebView) {
            WebViewPresent(viewModel: viewModel)
        }
    }
}


