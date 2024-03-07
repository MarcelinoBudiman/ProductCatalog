//
//  ProductCatalogView.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import SwiftUI

struct ProductCatalogView: View {
    
    var imageName: String
    var productName: String
    var productPrice: Float
    var rating: Float
    
    var body: some View {
        
  
        VStack {
            
            HStack {
                Spacer()
                VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: Constants.screenWidth * 0.45)
                        .frame(maxWidth: Constants.screenWidth * 0.45)
                        .cornerRadius(10)
                        .clipped()
                
                    Text(productName)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: Constants.screenWidth * 0.45, alignment: .leading)
                        .lineLimit(2)
                    
                    HStack {
                        Text("Rp ")
                        Spacer()
                            .frame(width: Constants.screenWidth * 0.01)
                        Text(productPrice, format: .number)
                            
                    }
                    .font(.system(size: 15, weight: .heavy))
                    .frame(maxWidth: Constants.screenWidth * 0.45, alignment: .leading)
                    
                    Spacer()
                        .frame(height: Constants.screenHeight * 0.001)
                    
                    HStack {
                        
                        Image(Constants.Images.star)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: Constants.screenHeight * 0.02)
                            .clipped()
                        
                        Text(verbatim: "\(rating)")
                            .font(.system(size: 10, weight: .light))
                            .foregroundStyle(.gray)
 
                    }
                    .frame(maxWidth: Constants.screenWidth * 0.45, alignment: .leading)
                    
                }
                Spacer()
            }
            
        }

        

    }
}

#Preview {
    ProductCatalogView(imageName: Constants.Images.samsungS10, productName: "Samsung S10asofknasfnasfnaskfnsakfndksnfkdjsnfkdsnfkdsnfkjdsnfkdsnfkjdsnfk", productPrice: 5000000, rating: 4.5)
}
