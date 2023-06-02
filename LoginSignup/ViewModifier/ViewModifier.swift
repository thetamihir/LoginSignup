//
//  ViewModifier.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 25/05/23.
//

import Foundation
import SwiftUI


// MARK: Custome ViewModifier
 
struct ButtonStyle : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(LinearGradient(gradient: Gradient(colors: [Color("yellow_light") , Color("yellow_dark")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
    }

}


struct RoundedShape : ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("field_color"), lineWidth: 1)
        }
    }
}


 // Mark :- Custome views
struct RoundedImageTextField: View {
    var textField: SecureField<Text>
    var imageName: String
    var body: some View {
        HStack {
            textField
            Image("pass_hide")
        }
    }
}


