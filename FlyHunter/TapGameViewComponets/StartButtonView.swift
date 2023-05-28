//
//  StartButtonView.swift
//  TapGame
//
//  Created by Igor Kononov on 25.05.2023.
//

import SwiftUI

struct StartButtonView: View {
    @StateObject var viewModel: FlyHunterViewModel
    var body: some View {
        ZStack {
            Spacer()
            Button {
                withAnimation{
                    viewModel.startGame()
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("black_with_dark"))
                        .frame(width: ScreenSize.width * 0.7 + 5, height: 55)
                        .cornerRadius(30)
                    
                    Rectangle()
                        .foregroundColor(viewModel.gameIsWin == nil ? .green : .orange)
                        .frame(width: ScreenSize.width * 0.7, height: 50)
                        .cornerRadius(30)
                    
                    Text(viewModel.gameIsWin == nil ? "Start" : "Ok")
                        .foregroundColor(Color("white_with_dark"))
                        .fontWeight(.bold)
                        .font(.title2)
                }
            }
            .padding(.bottom, ScreenSize.height * 0.05)
        }
        .opacity(viewModel.gameHasStarted ? 0 : 1)
        .offset(y: viewModel.gameHasStarted ? ScreenSize.height * 0.5 : 0)
        .animation(.easeInOut)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(viewModel: FlyHunterViewModel())
    }
}
