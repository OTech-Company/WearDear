//
//  SizeView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct SizeView: View {
    let sizes = ["UK 6", "UK 7", "UK 8", "UK 9"]
    var body: some View {
        VStack(spacing: 12) {
            Text("Size")
            ForEach(sizes, id: \.self) { size in
                Text(size)
                    .frame(width: 60, height: 45)
                    .background(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                    }
            }
        }
    }
}

