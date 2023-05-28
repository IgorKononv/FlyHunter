//
//  TapGameViewModel.swift
//  TapGame
//
//  Created by Igor Kononov on 25.05.2023.
//

import SwiftUI

final class FlyHunterViewModel: ObservableObject {
    @Published var gameHasStarted = false
    @Published var positionFly: CGPoint = CGPoint(x: 0, y: 0)
    @Published var secondsRemaining = 0
    @Published var tenthsOfSecondRemaining = 0
    @Published var deadFly = 0
    @Published var timer: Timer?
    @Published var gameIsWin: Bool?
    @Published var colorTimer: Color = Color("black_with_dark")
    @Published var endGameText = ""
    @Published var showWebView = false
    @Published var webModel: WebModel?
    var webMenaging: WebMenaging?
    
    init() {
        fetchDatalink()
    }
    
    func fetchDatalink() {
        webMenaging = WebMenager()
        webMenaging?.fetchDatalink(completion: { [weak self] model in
            self?.webModel = model
        })
    }
    
    func startGame() {
        if gameIsWin != nil {
            gameIsWin = nil
        } else {
            setDefaultSettings()
            placeAimRandomly()
            startTimer()
        }
    }
    
    func killFly() {
        deadFly += 1
        placeAimRandomly()
        if deadFly == 10 {
            endGame()
        }
    }
    
    private func endGame() {
        chekIsUserWon()
        gameHasStarted = false
        colorTimer = Color("black_with_dark")
        stopTimer()
        showWebView = true
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] timer in
            if tenthsOfSecondRemaining < 9 {
                tenthsOfSecondRemaining += 1
            } else {
                if secondsRemaining < 9 {
                    secondsRemaining += 1
                    tenthsOfSecondRemaining = 0
                } else {
                    timer.invalidate()
                }
            }
            setColorTimer()
            chekIsGameLoseCauseTimeIsUp()
        }
    }
    
    private func setColorTimer() {
        if secondsRemaining == 5 {
            colorTimer = .yellow
        } else if secondsRemaining == 6 {
            colorTimer = .orange
        } else if secondsRemaining == 7 {
            colorTimer = .red
        }
    }
    
    private func chekIsGameLoseCauseTimeIsUp() {
        if secondsRemaining == 9 && tenthsOfSecondRemaining == 9 {
            gameIsWin = false
            endGameText = "My grandmother has a faster reaction \n flies have taken over the whole world 😡"
            endGame()
        }
    }
    
    private func chekIsUserWon() {
        if secondsRemaining > 6 {
            if gameIsWin == nil {
                gameIsWin = false
                endGameText = "Nice try but too slow \n unfinished flies come back soon 😢"
            }
        } else {
            gameIsWin = true
            endGameText = "Well done \n your finger saved the whole world 😏"
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func placeAimRandomly() {
        let minX = 50.0
        let minY = 50.0
        let maxX = ScreenSize.width - ScreenSize.width * 0.05
        let maxY = ScreenSize.height - ScreenSize.height * 0.2
        
        positionFly = CGPoint(
            x: CGFloat.random(in: minX...maxX),
            y: CGFloat.random(in: minY...maxY)
        )
    }
    
    private func setDefaultSettings () {
        gameHasStarted = true
        secondsRemaining = 0
        tenthsOfSecondRemaining = 0
        deadFly = 0
        endGameText = ""
    }
}

