//
//  ColoredRectangle.swift
//  EnvironmentVariablesInSwiftUI
//
//  Created by Ramill Ibragimov on 29.10.2020.
//

import SwiftUI

struct ColoredRectangle: View {
    var color: UIColor
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color(color))
            .padding()
    }
}
