//
//  CartManager.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import Foundation

import SwiftUI


class CartManager:ObservableObject{
    @Published var productInCart:[ProductInCart] = []
    var addtocartAlert:Bool = false
    
    var displaytotalCartQuantity:Int{
        productInCart.reduce(0) { $0 + $1.quantity }
    }
    
    var displayTotlaCartPrice:String{
        let totalPrice = productInCart.reduce(0) {$0 + $1.quantity * $1.product.price}
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: totalPrice as NSNumber) ?? "$0.00"
    }
    
    
    func addToCart(product:Product) {
        if let indexofProductInCart = productInCart.firstIndex(where: {$0.id == product.id}){
            let currentQuantity = productInCart[indexofProductInCart].quantity
            let newQuantity = currentQuantity + 1
            let updatedProductinCart = ProductInCart(product: product, quantity: newQuantity)
            productInCart[indexofProductInCart] = updatedProductinCart
        }else{
            productInCart.append(ProductInCart(product: product, quantity: 1))
        }
    }
    
    func removefromCart(product:Product) {
        if let indexofProductInCart = productInCart.firstIndex(where: {$0.id == product.id}){
            let currentQuantity = productInCart[indexofProductInCart].quantity
            if currentQuantity > 1{
                let newQuantity = currentQuantity - 1
                let updatedProductinCart = ProductInCart(product: product, quantity: newQuantity)
                productInCart[indexofProductInCart] = updatedProductinCart
            }else{
                productInCart.remove(at: indexofProductInCart)
            }
           
        }else{
            productInCart.append(ProductInCart(product: product, quantity: 1))
        }
    }
}
