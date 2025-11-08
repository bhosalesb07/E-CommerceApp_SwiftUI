//
//  HomeViewModel.swift
//  E-CommerceApp
//
//  Created by Mac on 07/11/25.
//

import Foundation
import SwiftUI


class HomeviewModel:ObservableObject{
        
    @Published var showAllProduct = false
    
    func fetchProduct(filter:ProductFilter) -> [Product]{
        switch filter {
        case .all:
            return ProductsClient.fetchProducts()
        case .isFeatured:
            return ProductsClient.fetchProducts().filter({$0.isFeatured})
        case .highlyRated:
            return ProductsClient.fetchProducts().filter({$0.rating > 4})
        }
    }
}
