//
//  Protocols.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import Foundation

protocol DataServiceProtocol {
    func getData() -> [Product]
    func getFilteredData(searchKeyword: String, favouriteFilter: Bool, productData: [Product]) -> [Product]
}
