//
//  ProductsRemoteDataSourceImpl.swift
//  Carto
//
//  Created by Manona on 29/06/2026.
//

import Foundation

class ProductsRemoteDataSourceImpl: ProductsRemoteDataSource {

    private let apiClient: ShopifyAPIClient

    init(apiClient: ShopifyAPIClient = .shared) {
        self.apiClient = apiClient
    }

    func getProductInfo(productId: String) async throws -> ProductDTO {
        struct AdminProductResponse: Decodable {
            let product: ProductDTO
        }

        let response: AdminProductResponse = try await apiClient.requestREST(
            endpoint: .productDetail(id: productId)
        )

        return response.product
    }
}
