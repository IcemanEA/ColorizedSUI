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
                
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 75)
                    .foregroundColor(color)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 4)
                    )
                VStack {
                    SetColorView(value: $redValue, color: .red)
                    SetColorView(value: $greenValue, color: .green)
                    SetColorView(value: $blueValue, color: .blue)
                }
                
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
                .frame(width: 36, alignment: .leading)
                .foregroundColor(color)
            Slider(value: $value, in: 1...255, step: 1)
                .tint(color)
                .onChange(of: value, perform: onChange)
            TextField("", value: $value, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .frame(width: 36)
                .multilineTextAlignment(.trailing)
                .modifier(BorderedViewModifier())
        }
    }
    
    private func onChange(value: Double) {
        print(value)
    }
}

// Добавляем на текстовое поле модификатор
struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .shadow(color: .gray.opacity(0.3), radius: 3, x: 1, y: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
