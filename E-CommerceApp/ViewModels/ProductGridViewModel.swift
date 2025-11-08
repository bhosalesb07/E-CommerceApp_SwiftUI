//
//  ProductGridViewModel.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import Foundation


class ProductGridViewModel:ObservableObject{
    let filter: ProductFilter
    
    var product:[Product]{
        switch filter {
        case .all:
            return ProductsClient.fetchProducts()
        case .isFeatured:
            return ProductsClient.fetchProducts().filter({$0.isFeatured})
        case .highlyRated:
            return ProductsClient.fetchProducts().filter({$0.rating > 4})
        }
    }
    
    init(filter: ProductFilter) {
        self.filter = filter
    }
    
}
