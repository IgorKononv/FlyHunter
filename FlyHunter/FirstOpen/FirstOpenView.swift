//
//  FirstOpen.swift
//  TapGame
//
//  Created by Igor Kononov on 26.05.2023.
//

import SwiftUI

struct FirstOpenView: View {
    @StateObject var viewModel: FirstOpenViewModel

    var body: some View {
        ZStack {
            Color("white_with_dark")
                .ignoresSafeArea()
            VStack {
                Text("Welcome to Fly Hunter!")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color("black_with_dark"))
                    .padding()
                
                Text("In this thrilling game, your mission is to eliminate a pesky fly that randomly appears on the screen. Your goal? Defeat it 10 times!")
                    .bold()
                    .foregroundColor(Color("black_with_dark"))
                    .padding()
                
                Text("The fate of the world hangs in the balance. Succeed, and you'll save humanity from impending doom. Fail, and the world will be overrun by chaos.")
                    .bold()
                    .foregroundColor(Color("black_with_dark"))
                    .padding()
                
                Text("Sharpen your reflexes, channel your inner hunter, and prepare for the ultimate challenge. Will you emerge victorious and become the savior of mankind? It's time to find out!")
                    .bold()
                    .foregroundColor(Color("black_with_dark"))
                    .padding()
                
                Text("Good luck, brave warrior. The fate of the world is in your hands.")
                    .bold()
                    .foregroundColor(Color("black_with_dark"))
                    .padding()
                Spacer()
                Button {
                    withAnimation {
                        viewModel.dismissInstruction()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("black_with_dark"))
                            .frame(width: ScreenSize.width * 0.7 + 5, height: 55)
                            .cornerRadius(30)
                        
                        Rectangle()
                            .foregroundColor(Color("black_with_dark"))
                            .frame(width: ScreenSize.width * 0.7, height: 50)
                            .cornerRadius(30)
                        
                        Text("Ok")
                            .foregroundColor(Color("white_with_dark"))
                            .fontWeight(.bold)
                            .font(.title2)
                    }
                }
                .padding(.bottom, ScreenSize.height * 0.05)
            }
            .padding(.vertical, 50)
        }
        .offset(y: viewModel.firstOpen ? ScreenSize.height : 0)
        .opacity(viewModel.firstOpen ? 0 : 1)
    }
}
