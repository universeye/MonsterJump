//
//  ContentView.swift
//  MonsterJump
//
//  Created by Terry Kuo on 2022/5/4.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State private var currentTab: Tab = .bookmark
    
    var body: some View {
        VStack (spacing: 0) {
            TabView(selection: $currentTab) {
                Text(Tab.bookmark.rawValue)
                    .tag(Tab.bookmark)
                Text(Tab.home.rawValue)
                    .tag(Tab.home)
                Text(Tab.plus.rawValue)
                    .tag(Tab.plus)
                Text(Tab.search.rawValue)
                    .tag(Tab.search)
                Text(Tab.settings.rawValue)
                    .tag(Tab.settings)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
