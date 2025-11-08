//
//  ProductGridView.swift
//  E-CommerceApp
//
//  Created by Mac on 07/11/25.
//

import SwiftUI

struct ProductGridView: View {
    
    @State var viewModel:ProductGridViewModel
    
    
    init(filter:ProductFilter) {
        self.viewModel = ProductGridViewModel(filter: filter)
    }
  
    
    var body: some View {
        VStack{
            TwoColumnGrid {
                ForEach(viewModel.product) { product in
                    ProductRow(product: product)
                }
            }
        }
       
    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView(filter: .all)
    }
}
