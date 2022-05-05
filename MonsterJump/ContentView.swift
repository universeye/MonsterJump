//
//  ContentView.swift
//  MonsterJump
//
//  Created by Terry Kuo on 2022/5/4.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State private var currentTab: Tab = .bookmark
    
    var body: some View {
        VStack (spacing: 0) {
            TabView(selection: $currentTab) {
                VStack {
                    Image(Tab.bookmark.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Text(Tab.bookmark.rawValue)
                        
                }.applyBG()
                    .tag(Tab.bookmark)
                Text(Tab.home.rawValue).applyBG()
                    .tag(Tab.home)
                Text(Tab.plus.rawValue).applyBG()
                    .tag(Tab.plus)
                Text(Tab.search.rawValue).applyBG()
                    .tag(Tab.search)
                Text(Tab.settings.rawValue).applyBG()
                    .tag(Tab.settings)
            }
            //MARK: Custom Tab Bar
            CustomTabBar(currentTab: $currentTab)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                launchScreenManager.dismiss()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LaunchScreenManager())
    }
}
