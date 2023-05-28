//
//  TimerView.swift
//  TapGame
//
//  Created by Igor Kononov on 25.05.2023.
//

import SwiftUI

struct TimerView: View {
    @StateObject var viewModel: FlyHunterViewModel
    var body: some View {
        VStack {
            Text(viewModel.gameHasStarted ? "\(viewModel.secondsRemaining).\(viewModel.tenthsOfSecondRemaining)" : "Get ready!")
                .font(.largeTitle)
                .foregroundColor(viewModel.colorTimer)
                .opacity(viewModel.gameIsWin == nil ? 1 : 0)
            
            Text("🪰 - \(viewModel.deadFly)")
                .font(.title2)
                .opacity(viewModel.gameHasStarted ? 1 : 0)
                .padding(.top, 10)
            
            Text(viewModel.endGameText)
                .foregroundColor(Color("black_with_dark"))
                .multilineTextAlignment(.center)
                .opacity(viewModel.gameIsWin != nil ? 1 : 0)
            
        }
        .animation(.easeInOut(duration: 0.05))
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewModel: FlyHunterViewModel())
    }
}
