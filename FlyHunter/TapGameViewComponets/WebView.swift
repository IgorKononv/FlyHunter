//
//  SwiftUIView.swift
//  TapGame
//
//  Created by Igor Kononov on 26.05.2023.
//

import SwiftUI
import WebKit

struct WebViewPresent: View {
    @StateObject var viewModel: FlyHunterViewModel
    var body: some View {
        ZStack {
            WebView(urlString: viewModel.gameIsWin == true ? viewModel.webModel?.winner ?? "" : viewModel.webModel?.loser ?? "")
            
            Button {
                viewModel.showWebView = false
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("white_with_dark"))
                        .cornerRadius(30)
                        .frame(width: 110, height: 40)
                    
                    HStack {
                        Image("back_left_image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 15)
                            .colorMultiply(Color("black_with_dark"))

                        Text("Back")
                            .foregroundColor(Color("black_with_dark"))
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
            }
            .offset(x: -ScreenSize.width * 0.34 , y: -ScreenSize.height * 0.42)
        }
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

