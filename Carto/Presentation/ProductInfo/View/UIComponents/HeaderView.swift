//
//  HeaderView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct HeaderView: View {
    let title: String

    var body: some View {
        HStack(alignment: .top) {
            Button {} label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    }
            }
            Spacer()
            Text(title)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: 150)
            Spacer()
            Button {} label: {
                Image(systemName: "cart")
                    .foregroundColor(.black)
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    }
            }
        }
    }
}
