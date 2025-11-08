//
//  ProductDetailView.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var cartManager:CartManager
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
                        cartManager.addToCart(product: product)
                        cartManager.addtocartAlert = true
                    } label: {
                        Text("Add to cart")
                    }.buttonStyle(PrimarybuttonStyle())
                }
                .padding(.horizontal)
                Spacer()
            }
            .alert("Added to cart", isPresented: $cartManager.addtocartAlert) {
                Button("Ok") {
                    
                }
            } message: {
                Text("\(product.title) added to cart Successfully")
            }

        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: ProductsClient.fetchProducts()[0])
    }
}
