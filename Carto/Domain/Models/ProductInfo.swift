//
//  ProductInfo.swift
//  Carto
//
//  Created by Manona on 29/06/2026.
//

import Foundation
import SwiftUI

struct ProductInfo {
    let id: Int
    let title: String
    let price: Double
    let compareAtPrice: Double?
    let imageURL: String
    let sizes: [String]
    let colors: [String]

    var discountPercentage: Int? {
        guard let compareAtPrice = compareAtPrice, compareAtPrice > price else { return nil }
        let discount = (compareAtPrice - price) / compareAtPrice * 100
        return Int(discount.rounded())
    }
}

extension ProductInfo {
    static let mock = ProductInfo(
        id: 1,
        title: "Nike Air Max",
        price: 89.99,
        compareAtPrice: 129.99,
        imageURL: "shoes",
        sizes: ["S", "M", "L", "XL"],
        colors: ["black", "white", "red"]
    )
}
