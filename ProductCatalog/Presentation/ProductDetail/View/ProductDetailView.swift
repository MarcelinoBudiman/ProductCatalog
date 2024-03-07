//
//  ProductDetailView.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 07/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var homeController: HomeController
    @State var isFavourite: Bool = false
    @State var isZoomed: Bool = false
    
    let product: Product
    let selectedFilterState: String
    
    var body: some View {
        
        ScrollView {
            
            VStack (spacing: 0){
                
                ImageSliderView(product: product)
                
                Spacer()
                
                HStack {
                    Text("Rp ")
                    Spacer()
                        .frame(width: Constants.screenWidth * 0.01)
                    Text(product.productPrice, format: .number)
                        
                }
                .font(.system(size: 20, weight: .heavy))
                .frame(maxWidth: Constants.screenWidth * 0.9, alignment: .leading)
                
                HStack {
                    Text(product.productName)
                        .font(.system(size: 20, weight: .regular))
                        .lineLimit(2)
                    Spacer()
                    Button(action: {
                        withAnimation(.interpolatingSpring) {
                            homeController.favouriteProductToggle(productId: product.id, selectedFilterState: selectedFilterState)
                            self.isFavourite.toggle()
                        }
                        withAnimation(.bouncy) {
                            self.isZoomed.toggle()
                        }
                    }) {
                        Image(systemName: self.isFavourite ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                            .scaleEffect(isZoomed ? 1.5 : 1.0)
                    }
                    
                }.padding([.bottom, .horizontal])
                
                HStack {
                    
                    Image(Constants.Images.star)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: Constants.screenHeight * 0.02)
                        .clipped()
                    
                    Text(verbatim: "\(product.productRating)")
                        .font(.system(size: 10, weight: .light))
                        .foregroundStyle(.gray)

                }
                .padding([.bottom])
                .frame(maxWidth: Constants.screenWidth * 0.9, alignment: .leading)
                
            }.background(Color(uiColor: UIColor.systemGray6))
            
            VStack {
                Text("Description")
                    .font(.system(size: 20, weight: .heavy))
                    .frame(maxWidth: Constants.screenWidth * 0.9, alignment: .leading)
                
                Text(product.productDescription)
                    .font(.system(size: 20, weight: .regular))
            }
            .padding()
            .background(Color(uiColor: UIColor.systemGray6))
            
        }
        .background(Color(uiColor: UIColor.systemGray5))
        .onAppear {
            isFavourite = self.product.favourite
            isZoomed = self.product.favourite
        }
        
        
    }
}

#Preview {
    ProductDetailView(product: MockProductServices().mockData[0], selectedFilterState: "All")
}
