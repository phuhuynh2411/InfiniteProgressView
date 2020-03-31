//
//  ContentView.swift
//  InfiniteProgressView
//
//  Created by Huynh Tan Phu on 3/31/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

private var circleGray: Color {
    Color(red: 222.0/255.0, green: 227.0/255.0, blue: 226.0/255.0, opacity: 1.0)
}

struct InfiniteProgressView: View {
    
    @State var isAnimating = false
    @State var trim1: (CGFloat, CGFloat) = (0, 0.25)
    @State var trim2: (CGFloat, CGFloat) = (0.5, 0.75)
    
    @State private var rotationDegree = 0.0
    private var timeCurveAnimation: Animation {
        return Animation.timingCurve(0.6, 0.4, 0.4, 0.4, duration: 1.5)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .trim(from: trim1.0, to: trim1.1)
                    .stroke(lineWidth: 3)
                    .foregroundColor(circleGray)                
                Circle()
                    .trim(from: trim2.0, to: trim2.1)
                    .stroke(lineWidth: 3)
                    .foregroundColor(circleGray)
            }
        }
        .frame(width: 30, height: 30)
        .rotationEffect(.degrees(rotationDegree))
        .onAppear() {
            withAnimation(self.timeCurveAnimation) {
                self.rotationDegree = 1080.0
            }
        }
    }
}

struct InfiniteProgressView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteProgressView()
    }
}
