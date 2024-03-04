//
//  CookieClickerApp.swift
//  CookieClicker
//
//  Created by Stijn Lingmont on 04/03/2024.
//

import SwiftUI

@main
struct CookieClickerApp: App {
    @State var amountClicked: Double = 0.0
    @State var autoClickers = 0
    @State private var timer: Timer?

    var body: some Scene {
        WindowGroup {
            ContentView(amountClicked: $amountClicked, autoClickers: $autoClickers)
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            amountClicked += (Double(autoClickers) * 0.1)
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
