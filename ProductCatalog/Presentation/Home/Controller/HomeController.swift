//
//  HomeController.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import Foundation
import SwiftUI

class HomeController: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    
    var dataServices: DataServiceProtocol
    
    init(dataServices: DataServiceProtocol) {
        self.dataServices = dataServices
    }
    
    func loadProduct() {
        let data = dataServices.getData()
        self.products.append(contentsOf: data)
        self.loadFilteredProduct(favourite: false)
    }
    
    func loadFilteredProduct(favourite: Bool) {
        let data = dataServices.getFilteredData(searchKeyword: self.searchText, favouriteFilter: favourite, productData: self.products)
        self.filteredProducts.removeAll()
        self.filteredProducts.append(contentsOf: data)
    }
    
    func favouriteProductToggle(productId: Int, selectedFilterState: String) {
       
        if let index = self.products.firstIndex(where: {$0.id == productId}) as Int? {
            self.products[index].favourite.toggle()
        } else {
            print("Error Toggling Favourite on product with id \(productId)")
        }
        
        if let index = self.filteredProducts.firstIndex(where: {$0.id == productId}) as Int? {
            self.filteredProducts[index].favourite.toggle()
        } else {
            print("Error Toggling Favourite on filtered product with id \(productId)")
        }
        
        self.loadFilteredProduct(favourite: selectedFilterState == "All" ? false : true)
        
    }
    
}
