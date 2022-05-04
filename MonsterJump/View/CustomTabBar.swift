//
//  CustomTabBar.swift
//  MonsterJump
//
//  Created by Terry Kuo on 2022/5/4.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    @State private var yOffset: CGFloat = 0 //To animate like curve.
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                            yOffset = -60
                        }
                        
                        //MARK: reset yOffset with slight delay
                        withAnimation(.easeInOut(duration: 0.1).delay(0.07)) {
                            yOffset = 0
                        }
                    } label: {
                            Image(tab.rawValue)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(currentTab == tab ? Color("Purple") : .gray)
                        //Little scalling effect
                                .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(Color("Yellow"))
                    .frame(width: 25, height: 25)
                    .offset(x: 10, y: yOffset)
                    .offset(x: indicatorOffset(width: width))
            }
        }
        .frame(height: 30)
        .padding(.bottom, 10)
        .padding([.horizontal, .top])
    }
    
    //Indicator Offset
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 { return 0 }
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        return index * buttonWidth
    }
    
    func getIndex() -> Int {
        switch currentTab {
        case .bookmark:
            return 0
        case .home:
            return 1
        case .plus:
            return 2
        case .search:
            return 3
        case .settings:
            return 4
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
