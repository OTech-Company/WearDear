//
//  Navigator.swift
//  Carto
//
//  Created by Osama Hosam on 01/07/2026.
//

import SwiftUI
import Combine

final class Navigator: ObservableObject, Router {

    // MARK: - Published navigation state

    @Published var path = NavigationPath()

    @Published var sheet: Route?

    @Published var fullScreenCover: Route?

    /// The current stack's root, used to reset onto a whole new flow
    /// (e.g. Auth -> Home after a successful login).
    @Published var root: Route

    init(root: Route = .splash) {
        self.root = root
    }

    // MARK: - Router

    
    var pathBinding: Binding<NavigationPath> {
           Binding(get: { self.path }, set: { self.path = $0 })
    }
    
    func push(_ route: Route) {
        path.append(route)
    }

    func present(_ route: Route, as presentation: Presentation) {
        switch presentation {
        case .push:
            push(route)
        case .sheet:
            sheet = route
        case .fullScreenCover:
            fullScreenCover = route
        }
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func pop(to route: Route) {
        popToRoot()
        push(route)
    }

    func dismiss() {
        sheet = nil
        fullScreenCover = nil
    }

    func setRoot(_ route: Route) {
        popToRoot()
        root = route
    }
    
    var sheetBinding: Binding<Route?> {
        Binding(get: { self.sheet }, set: { self.sheet = $0 })
    }
 
    var fullScreenCoverBinding: Binding<Route?> {
        Binding(get: { self.fullScreenCover }, set: { self.fullScreenCover = $0 })
    }
    
}
