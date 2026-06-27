//
//  ColorView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct ColorView: View {

    var body: some View {
        VStack {
            Text("Color")
                .bold()
            VStack{
                Circle()
                    .fill(.red)
                    .frame(width: 25,height: 25)
                Circle()
                    .fill(.blue)
                    .frame(width: 25,height: 25)

            }

        }

    }

}


