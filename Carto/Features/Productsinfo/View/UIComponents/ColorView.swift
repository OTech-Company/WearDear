//
//  ColorView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct ColorView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Color")
                .bold()

            Circle()
                .fill(.red)
                .frame(width: 28, height: 28)
                .overlay {
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                }

            Circle()
                .fill(Color(red: 0.2, green: 0.2, blue: 0.5))
                .frame(width: 28, height: 28)
        }
    }
}
