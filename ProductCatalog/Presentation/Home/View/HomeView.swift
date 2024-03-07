//
//  HomeView.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeController: HomeController
    @State var selectedFilterButton: String = "All"
    
    let filterButtonItems: [String] = ["All", "Favourited"]
    
    let columns = [
        GridItem(.flexible(minimum: Constants.screenWidth*0.45, maximum: Constants.screenWidth*0.45), spacing: Constants.screenWidth * 0.05),
        GridItem(.flexible(minimum: Constants.screenWidth*0.45, maximum: Constants.screenWidth*0.45))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                HStack {
       
                    Spacer()
                        .frame(width: Constants.screenWidth * 0.05)
                    
                    ForEach(filterButtonItems, id:\.self) { text in
                        Button {
                            selectedFilterButton = text
        
                            homeController.loadFilteredProduct(favourite: selectedFilterButton == "All" ? false : true)
                            
                        } label: {
                            Text(text)
                                .withFilterButtonFormatting(selected: text == selectedFilterButton ? true : false)
                        }
                    }
                    
                    Spacer()

                }
                .opacity(homeController.searchText.isEmpty ? 1 : 0)
                
                LazyVGrid(columns: columns) { 
                    
                    ForEach(homeController.filteredProducts, id: \.id) { product in
                        NavigationLink(value: product) {
                            ProductCatalogView(imageName: product.productImage, productName: product.productName, productPrice: product.productPrice, rating: product.productRating)
                                .padding([.bottom])
                        }
                        .buttonStyle(.plain)
                    }
                    
                }
                
                Spacer()
                
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product, selectedFilterState: selectedFilterButton)
            }
          
        }
        .searchable(text: $homeController.searchText)
        .onAppear {
            homeController.loadProduct()
        }
        .onChange(of: homeController.searchText) { _ in
            homeController.loadFilteredProduct(favourite: selectedFilterButton == "Favourited" ? true : false)
        }
    }
}

#Preview {
    HomeView().environmentObject(HomeController(dataServices: MockProductServices()))
}
