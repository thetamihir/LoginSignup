//
//  AuthButtonsView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import SwiftUI

struct AuthButtonsView: View {
    var body: some View {
        HStack(alignment : .center , spacing: 30){
            Button(action: {
            }, label: {
                Image("logo_google")
            })
            Button(action: {
            }, label: {
                Image("logo_facebook")
            })
                
            Button(action: {
            }, label: {
                Image("logo_apple")
            })
        }
        .padding()
    }
}

struct AuthButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        AuthButtonsView()
    }
}
