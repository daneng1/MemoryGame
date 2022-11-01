//
//  ContentView.swift
//  playarea
//
//  Created by Dan Engel on 7/14/22.
//

import SwiftUI

struct Arrow: Shape {
   
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX * 0.5, y: rect.midY * 0.5))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX * 1.5, y: rect.midY * 0.5))
        path.addLine(to: CGPoint(x: rect.midX * 1.25, y: rect.midY * 0.5))
        path.addLine(to: CGPoint(x: rect.midX * 1.25, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX * 0.75, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX * 0.75, y: rect.midY * 0.5))
        path.closeSubpath()
        
        return path
    }
}

struct ContentView: View {
    @State private var strokeAmount = 2.0
    @State private var color = 0.2
    
//    Creating an adaptive grid layout
//    let layout = [
//        GridItem(.adaptive(minimum: 80)),
//    ]

    
    var body: some View {
        VStack {
            Arrow()
            .stroke(Color(hue: color, saturation: 1, brightness: 1), style: StrokeStyle(lineWidth: strokeAmount, lineCap: .square, lineJoin: .miter))
                .frame(width: 400, height: 400)
                .padding([.horizontal, .bottom])
            
            Text("Stroke width")
            Slider(value: $strokeAmount, in: 0.6...20, step: 0.2)
                .padding([.horizontal, .bottom])
            
            Text("Color")
            Slider(value: $color)
                
        }
            
    }
}

    //          Navigation View using JSONDecode along with a list

    //        NavigationView {
    //            List(1..<121) { row in
    //                NavigationLink {
    //                    Button("Decode JSON") {
    //                        let input = """
    //                        {
    //                            "name": "Taylor Swift",
    //                            "address": {
    //                                "street": "555 fifth ave",
    //                                "city": "Nashville",
    //                                "state": "TN",
    //                            }
    //                        }
    //                        """
    //
    //                        let data = Data(input.utf8)
    //
    //                        if let user = try? JSONDecoder().decode(User.self, from: data) {
    //                            print("\(row) at \(user.address.street)")
    //                        }
    //                    }
    //                } label: {
    //                    Text("Taylor SwiftUI \(row)")
    //                }
    //            }
    //                .navigationTitle("SwiftUI")
    //        }
            
//        Geometry Reader
//        GeometryReader { geo in
//        Image("spider")
//            .resizable()
//            .scaledToFit()
//            .frame(width: geo.size.width)
//            .frame(width: geo.size.width, height: geo.size.height)
            
            // Animation
//        Button("Tap Me") {
//            withAnimation{
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1.0, y:1.0, z: 1.0))
//        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
