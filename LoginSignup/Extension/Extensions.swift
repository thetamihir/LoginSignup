//
//  Extensions.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 24/05/23.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
        
    }
}


extension View {
    
    
    func roundedShapeField() -> some View {
        self.modifier(RoundedShape())
    }
    
    func gradientButton() -> some View {
        self.modifier(ButtonStyle())
    }
    
    
}
