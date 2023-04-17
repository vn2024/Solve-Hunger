//
//  SplashScreen.swift
//  SolveHunger
//
//  Created by Varsha Narasiman on 10/23/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        } else {
            NavigationView {
        ZStack {
            Image("bg").resizable().ignoresSafeArea().scaledToFill()
            VStack(alignment:.center) {
        Spacer().frame(height: 100)
        ZStack {
            Image("hands").resizable().frame(width: 180.0, height: 180.0, alignment: .center)
                .rotationEffect(Angle(degrees: 360))
            Image("plate (1)").resizable().frame(width: 100.0, height: 100.0, alignment: .center).rotationEffect(Angle(degrees: 360))
        }
        Text("SOLVE HUNGER").font(.title).bold()
        Spacer().frame(height:7.0)
        Text("Make the World a Better Place").font(.title3)
        Spacer().frame(height: 200)
            }.scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
