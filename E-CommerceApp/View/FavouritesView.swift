//
//  FavouritesView.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favouritesManager: FavouritesManager
    
    fileprivate func FavourteProductRow(product:Product)-> some View {
        HStack{
            Image(product.image)
                .squareImageStyle()
                
            VStack(alignment: .leading){
                Text(product.title)
                    .font(.system(size: 15,weight: .semibold))
                    .padding(.bottom,1)
                Text(product.description)
                    .lineLimit(2)
                    .font(.system(size: 15))
            }
            Button {
                favouritesManager.products.removeAll(where: {$0.id == product.id})

            } label: {
                Image(systemName: "heart.fill")
            }

        }
    }
    
    var body: some View {
        VStack{
            List(favouritesManager.products) { product in
             
                FavourteProductRow(product: product)
            }
        }.overlay {
           if favouritesManager.products.count == 0{
                Text("No data found")
            }
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
