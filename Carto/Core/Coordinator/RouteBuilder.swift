//
//  RouteBuilder.swift
//  Carto
//
//  Core/Coordinator
//

import SwiftUI

@MainActor @ViewBuilder
func routeBuilder(for route: Route, router: Router) -> some View {
    switch route {

    case .onboarding:
        OnboardingScreen()
        
    case .home:
        HomeView()

    case .categoryList:
        makeCategoryListScreen(router: router)

    case .orderHistory:
        makeOrderHistoryScreen(router: router)

    case .favorites:
        FavoritesView()

    case .profile:
        ProfileView()

    case .categoryDetail(let id):
        Text("Category detail for \(id)") // TODO: CategoryDetailView

    case .subcategoryList(let parentId):
        Text("Subcategories of \(parentId)") // TODO: SubcategoryListView

    case .productInfo(let id):
        Text("Product \(id)") // TODO: ProductInfoView

    case .orderDetail(let id):
        Text("Order detail for \(id)") // TODO: OrderDetailView

    case .shoppingCart:
        Text("Shopping cart") // TODO: ShoppingCartView

    case .checkout:
        Text("Checkout") // TODO: CheckoutView

    case .payment(let orderTotal):
        Text("Pay \(orderTotal)") // TODO: PaymentView

//    case .editProfile:
//        Text("Edit profile") // TODO: EditProfileView

    case .settings:
        Text("Settings") // TODO: SettingsView

    case .coupons:
        Text("Coupons") // TODO: CouponsView

    case .search(let initialQuery):
        Text("Search \(initialQuery ?? "")") // TODO: SearchView
    case .splash:
        SplashView()
        
    case .orders:
        makeOrderHistoryScreen(router: router)
    }
}

@MainActor @ViewBuilder
private func makeCategoryListScreen(router: Router) -> some View {
    let repository = ServiceLocator.shared.resolveCategoryRepository()
    let useCase = GetCategoryUseCase(repository: repository)
    let viewModel = CategoryListViewModel(
        getCategoryUseCase: useCase,
        fetchSubcategoriesUseCase: useCase
    )

    if #available(iOS 17.0, *) {
        CategoryListView(viewModel: viewModel)
    } else {
        Text("Please upgrade to iOS 17.")
    }
}

@MainActor @ViewBuilder
private func makeOrderHistoryScreen(router: Router) -> some View {
    let repository = ServiceLocator.shared.resolveOrderRepository()
    let useCase = GetOrderHistoryUseCase(repository: repository)
    let viewModel = OrderHistoryViewModel(
        getOrderHistoryUseCase: useCase
    )

    if #available(iOS 17.0, *) {
        OrderHistoryView(viewModel: viewModel)
    } else {
        Text("Please upgrade to iOS 17.")
    }
}
