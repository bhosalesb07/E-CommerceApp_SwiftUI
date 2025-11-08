//
//  ProductDetailView.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product:Product
    
    var body: some View {
        ScrollView{
            VStack{
                Image(product.image).BannerImageStyle()
                Group{
                    Text(product.title)
                        .font(.system(size: 20,weight: .semibold))
                        .padding(.bottom,5)
                    Text(product.description)
                        .font(.system(size: 15))
                        .padding(.bottom,15)
                    Button {
                        
                    } label: {
                        Text("Add to cart")
                    }.buttonStyle(PrimarybuttonStyle())
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: ProductsClient.fetchProducts()[0])
    }
}
