//
//  ProductsInfoView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct ProductsInfoView: View {

    @StateObject private var viewModel: ProductsInfoViewModel
    @State private var isDescriptionExpanded = false

    init(product: ProductInfo) {
        _viewModel = StateObject(wrappedValue: ProductsInfoViewModel(product: product))
    }

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.product.title.capitalizedFirstLetterOnly())
                .padding(.horizontal)

            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    SizeView(sizes: viewModel.product.sizes, selectedSize: $viewModel.selectedSize)

                    Spacer()

                    ZStack {
                        Image("NIKE")
                            .resizable()
                            .scaledToFit()

                        AsyncImage(url: URL(string: viewModel.product.imageURL)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 190)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 190, height: 190)
                        }
                    }
                    .frame(width: 190, height: 190)

                    Spacer()

                    VStack(spacing: 24) {
                        Button {
                            viewModel.toggleFavorite()
                        } label: {
                            Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.isFavorite ? .red : .black)
                                .frame(width: 44, height: 44)
                                .background(Color.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black.opacity(0.5), lineWidth: 1.5)
                                }
                        }
                        ColorView(colorNames: viewModel.product.colors, selectedColorIndex: $viewModel.selectedColorIndex)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 28)

                if !viewModel.product.description.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Description")
                            .font(.headline)

                        (
                            Text(viewModel.product.description)
                                .foregroundColor(.secondary)
                            +
                            Text("  " + (isDescriptionExpanded ? "Show less" : "Show more"))
                                .foregroundColor(.black)
                                .bold()
                        )
                        .font(.subheadline)
                        .lineLimit(isDescriptionExpanded ? nil : 2)
                        .onTapGesture {
                            withAnimation {
                                isDescriptionExpanded.toggle()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }

            Spacer()

            SwipeToAddView(
                price: viewModel.product.price,
                compareAtPrice: viewModel.product.compareAtPrice,
                discountPercentage: viewModel.product.discountPercentage,
                quantity: $viewModel.quantity
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(edges: .bottom)
        .onChange(of: viewModel.quantity) { newValue in
            if newValue > 0 {
                viewModel.addToCart()
            }
        }
    }
}
