//
//  LoginView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 24/05/23.
//

import SwiftUI

struct LoginView: View {
    
    
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    @State var navigateSignupScreen : Bool = false
  //  @Binding var currentView: ContentView

    @StateObject var loginVM = LoginViewModel()
    @StateObject var userVM = HomeViewModel()
    @State private var isSecured: Bool = true
    
    var body: some View {
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
            .navigationBarBackButtonHidden()
        
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
                SecureTextField
               .roundedShapeField()
        }
    }
    
    
    @ViewBuilder private var SecureTextField : some View {
        HStack {
            ZStack(alignment: .trailing) {
                TextField("Password", text: $loginVM.loginDataModel.password)
                    .textContentType(.password)
                    .focused($focus1)
                    .opacity(showPassword ? 1 : 0)
                    .autocapitalization(.none)
                SecureField("Password", text: $loginVM.loginDataModel.password)
                    .textContentType(.password)
                    .focused($focus2)
                    .opacity(showPassword ? 0 : 1)
                    .autocapitalization(.none)
                Button(action: {
                    showPassword.toggle()
                    if showPassword { focus1 = true } else { focus2 = true }
                }, label: {
                    Image(self.showPassword ? "pass_show" : "pass_hide" )
                })
            }
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
            NavigationLink(destination: HomeView(), isActive: $loginVM.loginDataModel.navigate) {
                Button(action: {
                    if(loginVM.validateUserInputs()){
                        loginVM.userLogin()
                        userVM.fetchUser()
                    }
                }, label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .gradientButton()
                    
                })
                .opacity(loginVM.loginDataModel.buttonOpecity)
                .disabled(loginVM.loginDataModel.buttonValidation)
                .alert(isPresented: $loginVM.loginDataModel.isPresentingErrorAlert, content: {
                    Alert(title: Text("Alert"), message: Text(loginVM.loginDataModel.error), dismissButton: .cancel(Text("Ok")))
                })
            }
                SpacerView()
                AuthButtonsView()
                HStack{
                    Text("Don’t have an Account? ")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                    NavigationLink {
                        SignUpView()
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

