//
//  CartView.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    fileprivate func CartRow(productInCart:ProductInCart) -> some View{
        HStack{
            Image(productInCart.product.image)
                .squareImageStyle()
            VStack(alignment: .leading){
                Text(productInCart.product.title)
                    .font(.system(size: 15))
                    .padding(.bottom,1)
                Text(productInCart.product.displayPrice)
                    .font(.system(size: 15))
                Stepper("Quantity \(productInCart.quantity)") {
                    cartManager.addToCart(product: productInCart.product)
                } onDecrement: {
                    cartManager.removefromCart(product: productInCart.product)
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            List{
                ForEach(cartManager.productInCart) { productInCart in
                    CartRow(productInCart:productInCart)
                }
            }
            if cartManager.productInCart.count > 0{
                VStack{
                    Divider()
                    HStack{
                        Text("Total: \(cartManager.displaytotalCartQuantity) Items")
                            .font(.system(size: 16))
                        Spacer()
                        Text(cartManager.displayTotlaCartPrice)
                            .font(.system(size: 16,weight: .bold))
                    }
                    .padding(.horizontal)
                    .padding(.vertical,20)
                }
            }
        }.overlay {
            if cartManager.productInCart.count == 0{
                Text("No data found")
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
