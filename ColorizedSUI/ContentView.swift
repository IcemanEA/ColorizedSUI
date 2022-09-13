//
//  ContentView.swift
//  ColorizedSUI
//
//  Created by Egor Ledkov on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.black
    
    @State private var redValue = 1.0
    @State private var greenValue = 1.0
    @State private var blueValue = 1.0
    
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
                    HStack {
                        LabelColor(value: $redValue)
                        Slider(value: $redValue, in: 1...255, step: 1)
                            .tint(.red)
                            .onChange(of: redValue, perform: changeSlider)
                        TextColor(value: $redValue)
                    }
                    HStack {
                        LabelColor(value: $greenValue)
                        Slider(value: $greenValue, in: 1...255, step: 1)
                            .tint(.green)
                            .onChange(of: greenValue, perform: changeSlider)
                        TextColor(value: $greenValue)
                    }
                    HStack {
                        LabelColor(value: $blueValue)
                        Slider(value: $blueValue, in: 1...255, step: 1)
                            .tint(.blue)
                            .onChange(of: blueValue, perform: changeSlider)
                        TextColor(value: $blueValue)
                    }
                }
                
                Spacer()
            }.padding()
        }
    }
    
    private func changeSlider(_ value: Double) {
        color = Color(red: redValue / 255.0, green: greenValue / 255.0, blue: blueValue / 255.0)
    }
}

struct LabelColor: View {
    @Binding var value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 36, alignment: .leading)
            .foregroundColor(.white)
    
    }
}

struct TextColor: View {
    @Binding var value: Double
    
    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter())
            .keyboardType(.numberPad)
            .frame(width: 36)
            .multilineTextAlignment(.trailing)
            .modifier(BorderedViewModifier())
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


// неудачная попытка все объединить...
//enum ChangeColor {
//    case red
//    case green
//    case blue
//
//    var color: Color {
//        switch self {
//        case .red:
//            return Color.red
//        case .green:
//            return Color.green
//        case .blue:
//            return Color.blue
//        }
//    }
//}

//struct SetColorView: View {
//    @Binding var value: Double
//    @Binding var color: Color
//
//    let type: ChangeColor
//
//    var body: some View {
//        HStack {
//            Text("\(lround(value))")
//                .frame(width: 36, alignment: .leading)
//                .foregroundColor(type.color)
//            Slider(value: $value, in: 1...255, step: 1)
//                .tint(type.color)
//                .onChange(of: value, perform: onChange)
//            TextField("", value: $value, formatter: NumberFormatter())
//                .keyboardType(.numberPad)
//                .frame(width: 36)
//                .multilineTextAlignment(.trailing)
//                .modifier(BorderedViewModifier())
//        }
//    }
//
//    private func onChange(value: Double) {
//        guard let cgColor = color.cgColor else { return }
//        let ciColor = CIColor(cgColor: cgColor)
//
//        print("\(color) - \(value) || \(ciColor.green)")
//    }
//}
