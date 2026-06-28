//
//  ProductsDetailsView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct ProductsDetailsView: View {
    @State private var quantity = 1

    var body: some View {
        VStack(spacing: 0) {

            HeaderView()
                .padding(.horizontal)

            HStack(alignment: .top) {
                SizeView()

                ZStack {
                    Image("nike")
                        .resizable()
                        .scaledToFit()

                    Image("shoes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                }

                VStack(spacing: 24) {
                    Button {} label: {
                        Image(systemName: "bookmark")
                            .foregroundColor(.black)
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            }
                    }

                    ColorView()
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)

            Spacer()

            SwipeToAddView(quantity: $quantity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
