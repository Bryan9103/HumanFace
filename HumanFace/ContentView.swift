//
//  ContentView.swift
//  HumanFace
//
//  Created by Bryan Andersen on 2024/1/3.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack{
            Rectangle() //neck
                .frame(width:80,height:200)
                .foregroundStyle(.brown)
                .offset(y:200)
            Group{ //face
                Group{ //ear
                    Circle()
                        .trim(from:0.2, to:0.8)
                        .frame(width:80)
                        .offset(x:-90)
                    Circle()
                        .trim(from:0.2, to:0.8)
                        .frame(width:40)
                        .offset(x:-90)
                        .foregroundStyle(.white)
                    Circle()
                        .trim(from:0.2, to:0.8)
                        .rotationEffect(.degrees(180))
                        .frame(width:80)
                        .offset(x:90)
                    Circle()
                        .trim(from:0.2, to:0.8)
                        .rotationEffect(.degrees(180))
                        .frame(width:40)
                        .offset(x:90)
                        .foregroundStyle(.white)
                }.foregroundStyle(.brown)
                
                Capsule() //head
                    .frame(width:200,height:250)
                    .foregroundStyle(.brown)
                
                Group{//eyes
                    Circle()
                        .frame(width:50)
                        .offset(x:-35, y:-20)
                        .foregroundStyle(.white)
                    Circle()
                        .frame(width:30)
                        .offset(x:-35, y:-20)
                    Circle()
                        .frame(width:50)
                        .offset(x:35, y:-20)
                        .foregroundStyle(.white)
                    Circle()
                        .frame(width:30)
                        .offset(x:35, y:-20)
                }
                
                
                Triangle() //nose
                    .frame(width:30, height:50)
                    .offset(y:30)
                
                Group{ //mouth
                    Circle()
                        .trim(from:0.0,to:0.5)
                        .frame(width:50)
                        .offset(y:70)
                    Rectangle()
                        .frame(width:10, height:10)
                        .offset(y:75)
                        .foregroundStyle(.white)
                        
                }
            }
            .offset(y: 10)
            Group{ //hat
                Triangle()
                    .foregroundColor(.green)
                    .frame(width: 180, height: 180)
                    .offset(y:-150)
                
                Group{ //stripes
                    Rectangle()
                        .trim(from: 0.16, to:0.8)
                        .frame(width:150, height:30)
                        .offset(x:-45, y:-100)
                    Rectangle()
                        .trim(from: 0.16, to:0.8)
                        .scale(x:-1)
                        .frame(width:150, height:30)
                        .offset(x:45, y:-100)
                }
                .foregroundStyle(.red)
                
                Group{ //stripes
                    Rectangle()
                        .trim(from: 0.13, to:0.8)
                        .frame(width:80, height:30)
                        .offset(x:-27, y:-150)
                    Rectangle()
                        .trim(from: 0.13, to:0.8)
                        .scale(x:-1)
                        .frame(width:80, height:30)
                        .offset(x:27, y:-150)
                }
                .foregroundStyle(.yellow)
            }
            
            RoundedRectangle(cornerRadius: 70)
                .frame(width:350, height:350)
                .offset(y:350)
                .foregroundStyle(.mint)
        }
        .offset(y:80)
    }
}

#Preview {
    ContentView()
}
