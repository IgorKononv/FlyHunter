//
//  AimView.swift
//  TapGame
//
//  Created by Igor Kononov on 25.05.2023.
//
import SwiftUI

struct AimView: View {
    @StateObject var viewModel: FlyHunterViewModel
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 68, height: 68)
                .foregroundColor(Color("black_with_dark"))
                .position(viewModel.positionFly)
            
            Image("fly_image")
                .resizable()
                .frame(width: 64, height: 64)
                .position(viewModel.positionFly)
        }
        .opacity(viewModel.gameHasStarted ? 1 : 0)
        .onTapGesture {
            withAnimation {
                viewModel.killFly()
            }
        }
    }
}
