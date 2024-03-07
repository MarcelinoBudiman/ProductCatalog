//
//  HomeController_Tests.swift
//  ProductCatalog_Tests
//
//  Created by Marcelino Budiman on 07/03/24.
//

import XCTest
@testable import ProductCatalog

final class HomeController_Tests: XCTestCase {
    
    var controller: HomeController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_HomeController_products_shouldBeEmpty() {

        let controller = HomeController(dataServices: MockProductServices())
        
        XCTAssertTrue(controller.products.isEmpty)
        
    }
    
    func test_HomeController_filteredProducts_shouldBeEmpty() {

        let controller = HomeController(dataServices: MockProductServices())
        
        XCTAssertTrue(controller.filteredProducts.isEmpty)
        
    }

    func test_HomeController_products_shouldHasValue() {

        let controller = HomeController(dataServices: MockProductServices())
        
        controller.loadProduct()
        
        XCTAssertNotNil(controller.products)
        
    }
    
    func test_HomeController_filteredProducts_shouldHasValue() {

        let controller = HomeController(dataServices: MockProductServices())
        
        controller.loadProduct()
        controller.loadFilteredProduct(favourite: false)
        
        XCTAssertNotNil(controller.products)
        
    }
    
    func test_HomeController_selectedProduct_shouldBeFavourited() {
        let productId: Int = 1
        
        let controller = HomeController(dataServices: MockProductServices())
        controller.loadProduct()
        controller.loadFilteredProduct(favourite: false)
        
        controller.favouriteProductToggle(productId: productId, selectedFilterState: "All")
        
        
        if let index = controller.products.firstIndex(where: {$0.id == productId}) {
            XCTAssertTrue(controller.products[index].favourite)
        }
        
    }
    
    

}
