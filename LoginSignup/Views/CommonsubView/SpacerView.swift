//
//  SpacerView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        HStack {
            VStack {
                LinearGradient(gradient: Gradient(colors: [Color("gradient_light") , Color("gradient_dark")]), startPoint: .leading, endPoint: .trailing)
                    .frame(height: 1)
                
            }
            Text("OR")
                .padding(.horizontal , 20)
                .font(.system(size: 20))
                .fontWeight(.medium)
            VStack {
                LinearGradient(gradient: Gradient(colors: [Color("gradient_dark") , Color("gradient_light")]), startPoint: .leading, endPoint: .trailing)
                    .frame(height: 1)
            }
        }
    }
}

struct SpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerView()
    }
}
