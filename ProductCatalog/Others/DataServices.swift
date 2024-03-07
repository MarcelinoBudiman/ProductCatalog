//
//  DataServices.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import Foundation

class MockProductServices: DataServiceProtocol {
    
    var mockData: [Product]
    
    init() {
        self.mockData = [Product(id: 1, productName: "Samsung TV", productImage: Constants.Images.samsungTV, productRating: 3.5, productPrice: 50000, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin diam diam, scelerisque sit amet fringilla facilisis, feugiat posuere quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed non turpis sit amet leo dictum semper. Integer quis eros viverra, luctus ligula a, gravida elit. Sed sit amet est in ex malesuada placerat. Nunc eget vulputate felis, in aliquet felis. Etiam nec porta augue. Praesent luctus fermentum arcu id sollicitudin. Ut laoreet, turpis rutrum laoreet lobortis, ligula est semper ex, vel varius nisi lorem et magna. In semper diam dui. Aliquam sit amet laoreet enim. Donec augue ante, tincidunt nec ligula vitae, consectetur laoreet ante.", favourite: false),
                         Product(id: 2, productName: "Samsung S10", productImage: Constants.Images.samsungS10, productRating: 4.5, productPrice: 150000, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin diam diam, scelerisque sit amet fringilla facilisis, feugiat posuere quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed non turpis sit amet leo dictum semper. Integer quis eros viverra, luctus ligula a, gravida elit. Sed sit amet est in ex malesuada placerat. Nunc eget vulputate felis, in aliquet felis. Etiam nec porta augue. Praesent luctus fermentum arcu id sollicitudin. Ut laoreet, turpis rutrum laoreet lobortis, ligula est semper ex, vel varius nisi lorem et magna. In semper diam dui. Aliquam sit amet laoreet enim. Donec augue ante, tincidunt nec ligula vitae, consectetur laoreet ante.", favourite: true),
                         Product(id: 3, productName: "Iphone 13", productImage:Constants.Images.iphone13, productRating: 5.0, productPrice: 13000000, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin diam diam, scelerisque sit amet fringilla facilisis, feugiat posuere quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed non turpis sit amet leo dictum semper. Integer quis eros viverra, luctus ligula a, gravida elit. Sed sit amet est in ex malesuada placerat. Nunc eget vulputate felis, in aliquet felis. Etiam nec porta augue. Praesent luctus fermentum arcu id sollicitudin. Ut laoreet, turpis rutrum laoreet lobortis, ligula est semper ex, vel varius nisi lorem et magna. In semper diam dui. Aliquam sit amet laoreet enim. Donec augue ante, tincidunt nec ligula vitae, consectetur laoreet ante.", favourite: false),
                         Product(id: 4, productName: "Macbook Pro 14\"", productImage: Constants.Images.macbook, productRating: 3.0, productPrice: 25000000, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin diam diam, scelerisque sit amet fringilla facilisis, feugiat posuere quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed non turpis sit amet leo dictum semper. Integer quis eros viverra, luctus ligula a, gravida elit. Sed sit amet est in ex malesuada placerat. Nunc eget vulputate felis, in aliquet felis. Etiam nec porta augue. Praesent luctus fermentum arcu id sollicitudin. Ut laoreet, turpis rutrum laoreet lobortis, ligula est semper ex, vel varius nisi lorem et magna. In semper diam dui. Aliquam sit amet laoreet enim. Donec augue ante, tincidunt nec ligula vitae, consectetur laoreet ante.", favourite: true)]
    }
    
    func getData() -> [Product] {
        return self.mockData
    }
    
    func getFilteredData(searchKeyword: String, favouriteFilter: Bool, productData: [Product]) -> [Product] {
        
        if !favouriteFilter && !searchKeyword.isEmpty {
            return productData.filter {$0.productName.contains(searchKeyword)}
        } else if favouriteFilter && searchKeyword.isEmpty {
            return productData.filter {$0.favourite == true}
        } else if !searchKeyword.isEmpty && favouriteFilter {
            return productData.filter {$0.productName.contains(searchKeyword) && $0.favourite == true}
        } else {
            return productData
        }
        
    }

}
