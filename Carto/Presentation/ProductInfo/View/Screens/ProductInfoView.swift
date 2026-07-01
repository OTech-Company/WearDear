//
//  ProductsInfoView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct ProductsInfoView: View {

    let productId: String

    @StateObject private var viewModel: ProductsInfoViewModel
    @State private var quantity = 0
    @State private var selectedSize = ""
    @State private var selectedColorIndex = 0

    init(productId: String) {
        self.productId = productId
        _viewModel = StateObject(wrappedValue: .make(productId: productId))
    }

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.product?.title ?? "")
                .padding(.horizontal)

            if viewModel.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else if let errorMessage = viewModel.errorMessage {
                Spacer()
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
            } else if let product = viewModel.product {
                HStack(alignment: .top) {
                    SizeView(sizes: product.sizes, selectedSize: $selectedSize)

                    ZStack {
                        Image("NIKE")
                            .resizable()
                            .scaledToFit()
                        
                        AsyncImage(url: URL(string: product.imageURL)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 220, height: 220)
                        }
                    }

                    VStack(spacing: 24) {
                        Spacer().frame(height: 20)
                        Button {} label: {
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                                .frame(width: 44, height: 44)
                                .background(Color.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                }
                        }
                        ColorView(colorNames: product.colors, selectedColorIndex: $selectedColorIndex)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)

                Spacer(minLength: 0)

                SwipeToAddView(price: product.price, discount: product.discount, quantity: $quantity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(edges: .bottom)
        .task {
            await viewModel.fetchProduct(productId: productId)
        }
        .onChange(of: viewModel.product?.sizes) { sizes in
            if selectedSize.isEmpty, let firstSize = sizes?.first {
                selectedSize = firstSize
            }
        }
    }
}
