//
//  Router.swift
//  Carto
//
//  Created by Osama Hosam on 01/07/2026.
//


//
//  Router.swift
//  Carto
//
//  Core/Coordinator
//
//  Abstraction that ViewModels depend on. ViewModels should NEVER import
//  SwiftUI or know about NavigationStack/NavigationPath directly — they
//  just call router.push(.productInfo(id: id)) and stay UI-framework agnostic,
//  which keeps them testable and true to Clean Architecture.
//

import Foundation

protocol Router: AnyObject {
    /// Push a route onto the current navigation stack.
    func push(_ route: Route)

    /// Present a route modally (sheet or full screen cover).
    func present(_ route: Route, as presentation: Presentation)

    /// Pop the last screen off the stack.
    func pop()

    /// Pop back to the root of the current stack.
    func popToRoot()

    /// Pop to a specific route already on the stack, if present.
    func pop(to route: Route)

    /// Dismiss whatever is currently presented modally.
    func dismiss()

    /// Replace the entire stack's root (e.g. after login, switch from Auth -> Home).
    func setRoot(_ route: Route)
}