//
//  ColorSliderView.swift
//  ColorizedSUI
//
//  Created by Egor Ledkov on 15.09.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            TextView(value: value)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = newValue.formatted()
                }
            TextFieldView(text: $text, value: $value)
        }
        .onAppear {
            text = value.formatted()
        }
    }
}



struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.gray)
            ColorSliderView(value: .constant(100), color: .red)
        }
    }
}
