//
//  SignUpView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 25/05/23.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Image("login_bg1")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    TitleView
                    TextFields
                    MiddleView
                    BottomView
                 }
                .padding(.horizontal , 30)
                }
                .frame(maxHeight: .infinity)
            }
        }
    }

@ViewBuilder private var TitleView : some View {
    UpperTitleView(title: "Register", subTitle: "Create your new account")
}

@ViewBuilder private var TextFields : some View {
    TextField("Name", text: .constant(""))
        .roundedShapeField()
    TextField("E-mail", text: .constant(""))
        .roundedShapeField()
    TextField("Phone", text: .constant(""))
        .roundedShapeField()
    
    RoundedImageTextField(textField: SecureField("Password", text: .constant("")), imageName: "passwordshow")
        .roundedShapeField()
}

@ViewBuilder private var MiddleView : some View {
    
    VStack{
        HStack{
            Text("By signing up you agree to our ")
                .font(.system(size: 12))
            Link(destination: URL(string: "google.com")!) {
                Text("Terms & Conditions")
                    .font(.system(size: 12))
                    .underline()
                    .foregroundColor(Color("highlight_color"))
            }
        }
        HStack{
            Text("and")
                .font(.system(size: 12))
            Link(destination: URL(string: "google.com")!) {
                Text("Privacy Policy")
                    .underline()
                    .font(.system(size: 12))
                    .foregroundColor(Color("highlight_color"))
            }
        }
    }
}



    @ViewBuilder private var BottomView : some View {
        VStack{
            Button {
                
            } label: {
                Text("Log In")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .gradientButton()
            }
            
            SpacerView()
            AuthButtonsView()
            HStack{
                Text("Don’t have an Account? ")
                    .fontWeight(.regular)
                    .font(.system(size: 12))
                Button {
                } label: {
                    Text("Create Account")
                        .foregroundColor(Color("highlight_color"))
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                }
                
            }
            
        }
    }



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
