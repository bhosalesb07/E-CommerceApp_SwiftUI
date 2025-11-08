//
//  Home.swift
//  E-CommerceApp
//
//  Created by Mac on 07/11/25.
//

import SwiftUI



struct Home: View {
    @StateObject var viewModel = HomeviewModel()
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var tabaManager: TabManager
    fileprivate var NavigationBar: some View{
        VStack{
            HStack{
                Spacer()
                Text("Ecommerce App")
                    .font(.system(size: 16,weight: .semibold))
                Spacer()
            }.overlay(alignment: .trailing) {
                Button {
                    tabaManager.selectedTab = 2
                } label: {
                    ZStack{
                        Image(systemName: "cart.fill")
                            .foregroundStyle(.black)
                        if cartManager.displaytotalCartQuantity > 0{
                            ZStack{
                                Circle()
                                Text("\(cartManager.displaytotalCartQuantity)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                            }.offset(CGSize(width: 10, height: -10))
                        }
                    }
                    
                }.padding(.trailing)
            }
        }
    }
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    NavigationBar
                    Image("banner").BannerImageStyle()
                    HStack{
                        Text("Featured")
                            .font(.system(size: 15,weight: .semibold))
                            .padding(.leading)
                        Spacer()
                        NavigationLink {
                            ProductGridView(filter: .isFeatured)
                        } label: {
                            Text("View All")
                                .font(.system(size: 15,weight: .bold))
                                .padding(.trailing)
                        }
                    }
                    .padding(.top)
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(viewModel.fetchProduct(filter: .isFeatured)) { product in
                                ProductRow(product: product)
                            }
                        }
                    }
                    .padding(.leading,5)
                    HStack{
                        Text("Highly Rated")
                            .font(.system(size: 15,weight: .semibold))
                            .padding(.leading)
                        Spacer()
                        NavigationLink {
                            ProductGridView(filter: .highlyRated)
                        } label: {
                            Text("View All")
                                .font(.system(size: 15,weight: .bold))
                                .padding(.trailing)
                        }
                    }
                    .padding(.top)
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(viewModel.fetchProduct(filter: .highlyRated)) { product in
                                ProductRow(product: product)
                            }
                        }
                    }
                    
                    Button {
                        viewModel.showAllProduct = true
                    } label: {
                        Text("See full catalog")
                    }.buttonStyle(PrimarybuttonStyle())
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $viewModel.showAllProduct) {
                ProductGridView(filter: .all)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
