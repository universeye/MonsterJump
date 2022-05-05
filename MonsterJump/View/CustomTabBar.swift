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
    @State private var isMoving: Bool = false
    @State private var movingDogOpacity: Double = 0
    @State private var DogOpacity: Double = 1
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isMoving = true
                            movingDogOpacity = 1
                            DogOpacity = 0
                            currentTab = tab
                            yOffset = -60
                        }
                        
                        //MARK: reset yOffset with slight delay
                        withAnimation(.easeInOut(duration: 0.3).delay(0.17)) {
                            yOffset = 0
                            isMoving = false
                            movingDogOpacity = 0
                            
                            DogOpacity = 1
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
                Image("pixelPug")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //                Circle()
                //                    .fill(Color("Yellow"))
                    .frame(width: 28, height: 28)
                    .offset(x: 1, y: yOffset)
                    .offset(x: indicatorOffset(width: width))
                    .opacity(DogOpacity)
                Image("pixelPug-move")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //                Circle()
                //                    .fill(Color("Yellow"))
                    .frame(width: 35, height: 35)
                    .offset(x: 1, y: yOffset)
                    .offset(x: indicatorOffset(width: width))
                    .opacity(movingDogOpacity)
                
                
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
