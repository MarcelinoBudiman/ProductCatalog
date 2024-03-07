//
//  ImageSliderView.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 07/03/24.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var index = 0
    var product: Product
    
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach((0..<3), id: \.self) { index in
                    CardView(image: product.productImage)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
        }
        .frame(width: Constants.screenWidth * 0.9, height: Constants.screenHeight * 0.4)
    }
}


struct CardView: View{
    
    var image: String
    
    var body: some View{
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: Constants.screenHeight * 0.4)
            .padding()
    }
}

#Preview {
    ImageSliderView(product: MockProductServices().mockData[0])
}
