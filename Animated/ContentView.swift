//
//  ContentView.swift
//  Animated
//
//  Created by Eric Terrisson on 08/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State var positionX = 0
    @State var positionY = 0
    @State var finalWidth = 20.0
    @State var opacityButton = 0.0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    print("tap")
                    withAnimation(.easeInOut(duration: 3).speed(1)) { // Move square to center
                        rotation += 360
                        scaleXY += 2.0
                        positionX -= 150
                        positionY += 30
                    }
                    withAnimation(.easeInOut(duration: 1).delay(3)) { // unlarge square
                        finalWidth = UIScreen.main.bounds.width
                        opacityButton = 1.0
                    }
                } label: {
                    VStack {
                        Rectangle()
                            .fill(Color(.cyan))
                            .frame(width: finalWidth, height: 20)
                            .rotationEffect(.degrees(rotation))
                            .scaleEffect(CGFloat(scaleXY))
                            .offset(x: CGFloat(positionX))
                        
                        Rectangle()
                            .fill(Color(.magenta))
                            .frame(width: finalWidth, height: 20)
                            .rotationEffect(.degrees(rotation))
                            .scaleEffect(CGFloat(scaleXY))
                            .offset(x: CGFloat(positionX),y: CGFloat(positionY))
                        
                        Rectangle()
                            .fill(Color(.orange))
                            .frame(width: finalWidth, height: 20)
                            .rotationEffect(.degrees(rotation))
                            .scaleEffect(CGFloat(scaleXY))
                            .offset(x: CGFloat(positionX),y: CGFloat(positionY)*2)
                    }
                }
            }
            Button {
                print("close")
                withAnimation(.easeInOut(duration: 1)) {
                    finalWidth = 20.0
                    opacityButton = 0.0
                }
                withAnimation(.easeInOut(duration: 3).delay(1).speed(1)) {
                    rotation -= 360
                    scaleXY -= 2.0
                    positionX += 150
                    positionY -= 30
                }
                
            } label: {
                VStack {
                    Image(systemName: "xmark.circle")
                    Text("Close")
                }
            }
            .opacity(opacityButton)
            .offset(y: CGFloat(positionY)*3)

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
