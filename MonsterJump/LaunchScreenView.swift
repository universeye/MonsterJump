//
//  LaunchScreenView.swift
//  MonsterJump
//
//  Created by Terry Kuo on 2022/5/5.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State private var firstPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            background
            logo
        }
        .onReceive(timer) { input in //whenever it reveive a value from our timer, trigger something
            switch launchScreenManager.state {
                
            case .first:
                //First phase with continuous scaling
                withAnimation(.spring()) {
                    firstPhaseIsAnimating.toggle()
                }
            case .second:
                withAnimation(.easeInOut) {
                    secondPhaseIsAnimating.toggle()
                }
            default: break
            }
            
        }
        .opacity(secondPhaseIsAnimating ? 0 : 1)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenManager())
    }
}


private extension LaunchScreenView {
    var background: some View {
        Color("launch-screen-color").edgesIgnoringSafeArea(.all)
    }
    
    var logo: some View {
        Image("pixelPug")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .scaleEffect(firstPhaseIsAnimating ? 0.6 : 1)
            .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height / 4 : 1)
    }
}
