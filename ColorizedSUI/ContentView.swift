//
//  ContentView.swift
//  ColorizedSUI
//
//  Created by Egor Ledkov on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.black
    
    @State private var redValue = Double.random(in: 0...255).rounded()
    @State private var greenValue = Double.random(in: 0...255).rounded()
    @State private var blueValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var focusedField: Field?
    
    @State private var alertPresented = false
    
    var body: some View {
        ZStack {
            Color(.blue)
                .opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
                
            VStack(spacing: 20) {
                ColorView(red: redValue, green: greenValue, blue: blueValue)
                
                VStack {
                    ColorSliderView(value: $redValue, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $greenValue, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blueValue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                
                Spacer()
            }.padding()
        }
    }
}

extension ContentView {
    
    private enum Field {
        case red
        case green
        case blue
    }
    
private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
