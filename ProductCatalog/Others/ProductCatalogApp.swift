//
//  ProductCatalogApp.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import SwiftUI

@main
struct ProductCatalogApp: App {
    
    @StateObject var homeController = HomeController(dataServices: MockProductServices())
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(homeController)
        }
    }
}
