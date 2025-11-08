//
//  ProductRow.swift
//  E-CommerceApp
//
//  Created by Mac on 07/11/25.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var favouritesManager:FavouritesManager
    let product: Product
    var body: some View {
        NavigationLink {
            ProductDetailView(product: product)
        } label: {
            VStack(alignment: .leading,spacing: 5){
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150,height: 150)
                //                            .clipShape(UnevenRoundedRectangle(
                //                                cornerRadii: .init(topLeading: 8, topTrailing: 8)
                //                            ))
                Group{
                    Text(product.title)
                        .lineLimit(1)
                        .foregroundStyle(.black)
                        .font(.system(size: 15,weight: .semibold))
                    
                    Text(product.displayPrice)
                        .font(.system(size: 15))
                        .foregroundStyle(.black)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(product.displayRating)
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                    }
                }.padding(.horizontal,5)
                Spacer()
            }
            .frame(width: 150, height: 270)
            .overlay(alignment: .topTrailing, content: {
                Button {
                   
                    if favouritesManager.products.contains(product){
                        favouritesManager.products.removeAll(where: {$0.id == product.id})
                    }else{
                        favouritesManager.products.append(product)
                    }
                    print(favouritesManager.products.contains(product))
                } label: {
                    
                    Image(systemName: favouritesManager.products.contains(product) ? "heart.fill" : "heart")
                        .foregroundStyle(.black)
                }.padding(8)
                
                
            })
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4),lineWidth: 1)
            }
        }

    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ProductRow(product: ProductsClient.fetchProducts()[0])
        }
    }
}
