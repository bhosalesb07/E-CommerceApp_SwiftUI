//
//  ProductInCart.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import Foundation
import SwiftUI

struct ProductInCart:Identifiable{
    var id:String{
        product.id
    }
    let product:Product
    var quantity:Int
}
