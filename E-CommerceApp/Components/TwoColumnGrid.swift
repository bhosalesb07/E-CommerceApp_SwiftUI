//
//  TwoColumnGrid.swift
//  E-CommerceApp
//
//  Created by Mac on 08/11/25.
//

import Foundation
import SwiftUI

struct TwoColumnGrid<Content:View>: View{
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ViewBuilder var content: () -> Content
    
    var body: some View
    {
        ScrollView{
            LazyVGrid(columns: columns) {
               content()
            }
        }
    }
}
