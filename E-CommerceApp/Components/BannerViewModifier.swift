//
//  BannerViewModifier.swift
//  E-CommerceApp
//
//  Created by Mac on 07/11/25.
//

import Foundation
import SwiftUI

extension Image{
    
    func BannerImageStyle() -> some View{
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width,height: 250)
    }
}
