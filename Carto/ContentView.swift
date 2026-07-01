//
//  ContentView.swift
//  Carto
//
//  Created by Osama Hosam on 01/07/2026.
//


//
//  ContentView.swift
//  Carto
//
//  Replaces MainView as the app's root. Same 5 tabs, same tint — the only
//  change is each tab now owns a Navigator + NavigationStack, so any page
//  inside a tab can push further screens via Route instead of that tab
//  being a dead end.
//

import SwiftUI

struct ContentView: View {

    // One Navigator per tab keeps each tab's back-stack independent,
    // matching standard iOS tab bar behavior (switch tabs, come back,
    // stack is exactly where you left it).
    @StateObject private var homeNavigator = Navigator()
    @StateObject private var categoriesNavigator = Navigator()
    @StateObject private var historyNavigator = Navigator()
    @StateObject private var favoritesNavigator = Navigator()
    @StateObject private var profileNavigator = Navigator()

    var body: some View {
        TabView {
            tab(rootRoute: .home, navigator: homeNavigator)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            tab(rootRoute: .categoryList, navigator: categoriesNavigator)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Categories")
                }

            tab(rootRoute: .orderHistory, navigator: historyNavigator)
                .tabItem {
                    Image(systemName: "history")
                    Text("history")
                }

            tab(rootRoute: .favorites, navigator: favoritesNavigator)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourits")
                }

//            tab(rootRoute: .profile, navigator: profileNavigator)
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
        }
        .tint(Color("PrimaryColor"))
    }

    /// Wraps one tab's root screen in its own NavigationStack, wired to its
    /// own Navigator, with sheet/full screen cover handling done once here
    /// so individual pages never need their own .sheet(...) boilerplate.
    @ViewBuilder
    private func tab(rootRoute: Route, navigator: Navigator) -> some View {
        NavigationStack(path: navigator.pathBinding) {
            routeBuilder(for: rootRoute, router: navigator)
                .navigationDestination(for: Route.self) { route in
                    routeBuilder(for: route, router: navigator)
                }
        }
        .sheet(item: navigator.sheetBinding) { route in
            routeBuilder(for: route, router: navigator)
        }
        .fullScreenCover(item: navigator.fullScreenCoverBinding) { route in
            routeBuilder(for: route, router: navigator)
        }
        .environmentObject(navigator)
    }
}

// Route needs Identifiable for the .sheet(item:)/.fullScreenCover(item:)
// bindings above.
extension Route: Identifiable {
    var id: Self { self }
}

#Preview {
    ContentView()
}

/*
 ── CartoApp.swift ──────────────────────────────────────────────────────
 Replace MainView() with ContentView():

 @main
 struct CartoApp: App {
     var body: some Scene {
         WindowGroup {
             ContentView()   // <- was MainView()
         }
     }
 }
 ─────────────────────────────────────────────────────────────────────────
*/
