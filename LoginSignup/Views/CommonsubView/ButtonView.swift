//
//  ButtonView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 31/05/23.
//

import SwiftUI

struct PassTextField: View {

@FocusState var focus1: Bool
@FocusState var focus2: Bool
@State var showPassword: Bool = false
@State var text: String = ""

var body: some View {
    HStack {
        ZStack(alignment: .trailing) {
            TextField("Password", text: $text)
               // .modifier(LoginModifier())
                .textContentType(.password)
                .focused($focus1)
                .opacity(showPassword ? 1 : 0)
            SecureField("Password", text: $text)
               // .modifier(LoginModifier())
                .textContentType(.password)
                .focused($focus2)
                .opacity(showPassword ? 0 : 1)
            Button(action: {
                showPassword.toggle()
                if showPassword { focus1 = true } else { focus2 = true }
            }, label: {
                Image(self.showPassword ? "pass_show" : "pass_hide" )
                    .padding()
            })
        }
    }
}
    struct LoginModifier: ViewModifier {

    var borderColor: Color = Color.gray

    func body(content: Content) -> some View {
        content
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
    }
    }
}


struct PassTextField_Previews: PreviewProvider {
    static var previews: some View {
        PassTextField()
    }
}
