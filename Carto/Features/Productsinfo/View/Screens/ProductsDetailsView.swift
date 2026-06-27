//
//  ProductsDetailsView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct ProductsDetailsView: View {
    var body: some View {
        VStack {

            HeaderView()

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
                    Image("save")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)

                    ColorView()
                }
            }

            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text("$30.99")
                        .font(.title2)
                        .bold()

                    Text("10% OFF")
                        .foregroundColor(.red)
                }
            }

            Spacer()

            Image("bag")
                .resizable()
                .scaledToFit()
                .frame(width: 260)
                .ignoresSafeArea(edges: .bottom)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
