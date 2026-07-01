//
//  ProductsInfoViewModel.swift
//  Carto
//
//  Created by Manona on 28/06/2026.
//

import Foundation
import Combine

@MainActor
class ProductsInfoViewModel: ObservableObject {

    @Published private(set) var product: ProductInfo?
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let useCase: ProductsInfoUseCase

    init(useCase: ProductsInfoUseCase) {
        self.useCase = useCase
    }

    static func make(productId: String) -> ProductsInfoViewModel {
        let repository = ServiceLocator.shared.resolveProductsRepository()
        let useCase = ProductsInfoUseCase(repository: repository)
        return ProductsInfoViewModel(useCase: useCase)
    }

    func fetchProduct(productId: String) async {
        isLoading = true
        errorMessage = nil
        do {
            product = try await useCase.execute(productId: productId)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
