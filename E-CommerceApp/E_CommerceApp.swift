//
//  E_CommerceApp.swift
//  E-CommerceApp
//
//  Created by Mac on 07/11/25.
//

import SwiftUI

@main
struct E_CommerceApp: App {
    @StateObject var favouritesManager = FavouritesManager()
    @StateObject var cartManager = CartManager()
    @StateObject var tabManager = TabManager()
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabManager.selectedTab, content: {
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                    .tag(2)
                FavouritesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                    }
                    .tag(3)
            })
                .environmentObject(favouritesManager)
                .environmentObject(cartManager)
                .environmentObject(tabManager)
                .preferredColorScheme(.light)
        }
    }
}
