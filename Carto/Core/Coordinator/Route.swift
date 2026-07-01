//
//  Route.swift
//  Carto
//
//  Core/Coordinator
//
//  Single source of truth for every destination in the app.
//  Add a case here whenever a new screen is introduced; the compiler
//  will then force you to handle it in RouteBuilder's switch.
//

import Foundation

enum Route: Hashable {

    // Onboarding / Auth
    case splash
    case onboarding
//    case login
//    case signUp
//    case forgotPassword

    // Main / Home
//    case ads
    case home
    case categoryList
    case subcategoryList(parentId: String)
    case categoryDetail(id: String)
//    case brands
//    case brandDetail(id: String)

    // Product
    case productInfo(id: String)
    case search(initialQuery: String? = nil)

    // User areas
    case profile
    case favorites
    case shoppingCart
    case checkout
    case payment(orderTotal: Double)
    case orders
    case orderDetail(id: String)
    case orderHistory
    case coupons

    // Settings
    case settings
}

enum Presentation {
    case push
    case sheet
    case fullScreenCover
}
