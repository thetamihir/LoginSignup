//
//  LoginView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 24/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginVM = LoginViewModel()
    @State private var isSecured: Bool = true
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Image("login_bg")
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



extension LoginView{
    @ViewBuilder private var TitleView : some View {
        UpperTitleView(title: "Welcome back", subTitle: "Login to your account")
    }


    @ViewBuilder private var TextFields : some View {
        VStack(alignment: .leading, spacing: 10){
            TextField("email", text: $loginVM.loginDataModel.email)
                .autocapitalization(.none)
                .roundedShapeField()
            RoundedImageTextField(
                textField: SecureField("password", text: $loginVM.loginDataModel.password),imageName: "passwordshow")
                .autocapitalization(.none)
                .roundedShapeField()
        }
    }

    @ViewBuilder private var MiddleView : some View {
        HStack{
            HStack{
                Button {
                } label: {
                    Image("remeber_unselecte")
                        .resizable()
                        .frame(width: 22 , height: 22)
                }
                Text("Remember me")
                    .foregroundColor(Color("field_color"))
                    .frame(width: 83 , height: 17)
                    .font(.system(size: 11))
                    .fontWeight(.medium)
            }
            
            Spacer()
            Button {
                
            } label: {
                Text("Forgot Password ?")
                    .foregroundColor(Color("highlight_color"))
                    .fontWeight(.medium)
                    .font(.system(size: 12))
            }
        }
    }
    @ViewBuilder private var BottomView : some View {
        VStack{
            Button(action: {
                if(loginVM.validateUserInputs()){
                    loginVM.authenticateUser()
                }
            }, label: {
                Text("Log In")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .gradientButton()
            }).alert(isPresented: $loginVM.loginDataModel.isPresentingErrorAlert, content: {
                Alert(title: Text("Alert"), message: Text(loginVM.loginDataModel.error), dismissButton: .cancel(Text("Ok")))
            })
            .navigationDestination(isPresented: $loginVM.loginDataModel.navigate) {
                HomeView()
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        //            .frame(width: 350, height: 700)
        //            .previewLayout(.sizeThatFits)
    }
}

