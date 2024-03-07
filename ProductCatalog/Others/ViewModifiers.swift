//
//  ButtonStyle.swift
//  ProductCatalog
//
//  Created by Marcelino Budiman on 06/03/24.
//

import Foundation
import SwiftUI

struct FilterButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(backgroundColor)
            .foregroundColor(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    
}


extension View {
    func withFilterButtonFormatting(selected: Bool) -> some View {
        modifier(FilterButtonViewModifier(backgroundColor: selected ? Color(UIColor.systemGray6) : Color(UIColor.systemBackground)))
    }
    
    
}
