//
//  Product.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import Foundation

struct Product: Codable, Hashable {
    let id: Int
    var productName: String
    var productImage: String
    var productRating: Float
    var productPrice: Float
    var productDescription: String
    var favourite: Bool
}

