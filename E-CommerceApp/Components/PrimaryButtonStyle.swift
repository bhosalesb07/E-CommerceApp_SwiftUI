//
//  PrimaryButtonStyle.swift
//  E-CommerceApp
//
//  Created by Mac on 07/11/25.
//

import Foundation
import SwiftUI

struct PrimarybuttonStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 15,weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
