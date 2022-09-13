//
//  ContentView.swift
//  ColorizedSUI
//
//  Created by Egor Ledkov on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.red
    
    @State private var redValue = Double.random(in: 1...255)
    @State private var greenValue = Double.random(in: 1...255)
    @State private var blueValue = Double.random(in: 1...255)
    
    var body: some View {
        ZStack {
            Color(.blue)
                .opacity(0.5)
                .ignoresSafeArea()
                
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 75)
                    .foregroundColor(color)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 4)
                    )
                
                SetColorView(value: $redValue, color: .red)
                SetColorView(value: $greenValue, color: .green)
                SetColorView(value: $blueValue, color: .blue)
                
                Spacer()
                    
            }.padding()
        }
    }
}

struct SetColorView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 40)
                .foregroundColor(color)
            Slider(value: $value, in: 1...255, step: 1)
                .tint(color)
            //TextField( ("", text: $redValue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
