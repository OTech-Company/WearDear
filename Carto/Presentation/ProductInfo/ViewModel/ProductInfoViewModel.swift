//
//  ProductsInfoViewModel.swift
//  Carto
//
//  Created by Manona on 29/06/2026.
//

import Foundation

@MainActor
final class ProductsInfoViewModel: ObservableObject {

    let product: ProductInfo
    @Published var quantity: Int = 0
    @Published var selectedSize: String = ""
    @Published var selectedColorIndex: Int = 0
    @Published private(set) var isFavorite: Bool = false

    init(product: ProductInfo) {
        self.product = product
        self.selectedSize = product.sizes.first ?? ""
    }

    func incrementQuantity() {
        quantity += 1
    }

    func decrementQuantity() {
        if quantity > 0 {
            quantity -= 1
        }
    }

    func toggleFavorite() {
        isFavorite.toggle()
    }

    func addToCart() {
    }
}
