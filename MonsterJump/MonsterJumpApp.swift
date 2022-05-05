//
//  MonsterJumpApp.swift
//  MonsterJump
//
//  Created by Terry Kuo on 2022/5/4.
//

import SwiftUI

@main
struct MonsterJumpApp: App {
    
    @StateObject var launchScreenManager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if launchScreenManager.state != .completed {
                    LaunchScreenView()
                }
                
            }
            .environmentObject(launchScreenManager)
        }
    }
}
