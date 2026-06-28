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
        VStack(alignment: .leading, spacing: 12) {
            Text("Size")
                .bold()

            ForEach(sizes, id: \.self) { size in
                Text(size)
                    .font(.caption)
                    .frame(width: 60, height: 40)
                    .background(.white)
                    .foregroundColor(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                size == "UK 7" ? Color.black : Color.gray.opacity(0.3),
                                lineWidth: 1
                            )
                    }
                    .cornerRadius(12)
            }
        }
    }
}
