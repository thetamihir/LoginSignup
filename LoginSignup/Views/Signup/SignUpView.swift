//
//  SignUpView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 25/05/23.
//

import SwiftUI

struct SignUpView: View {
    
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    //@Binding var currentView: ContentView
    
    @StateObject var signupVM : SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Image("signup_bg")
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
    }

extension SignUpView {
    
    @ViewBuilder private var TitleView : some View {
        UpperTitleView(title: "Register", subTitle: "Create your new account")
    }

    @ViewBuilder private var TextFields : some View {
        TextField("Name", text: $signupVM.signUpModel.name)
            .roundedShapeField()
            .autocapitalization(.none)
        TextField("E-mail", text: $signupVM.signUpModel.email)
            .roundedShapeField()
            .autocapitalization(.none)
        TextField("Phone", text: $signupVM.signUpModel.password)
            .roundedShapeField()
            .autocapitalization(.none)
        SecureTextField
            .roundedShapeField()
            .autocapitalization(.none)
    }

    @ViewBuilder private var SecureTextField : some View {
        HStack {
            ZStack(alignment: .trailing) {
                TextField("Password", text: $signupVM.signUpModel.passwordConfirm)
                    .textContentType(.password)
                    .focused($focus1)
                    .opacity(showPassword ? 1 : 0)
                SecureField("Password", text: $signupVM.signUpModel.passwordConfirm)
                    .textContentType(.password)
                    .focused($focus2)
                    .opacity(showPassword ? 0 : 1)
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
                NavigationLink(destination: HomeView(), isActive: $signupVM.signUpModel.navigate) {
                    Button(action: {
                        signupVM.userSignup()
                    }, label: {
                        Text("signUp")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .gradientButton()
                        
                    })
//                    .opacity(signupVM.signUpModel.buttonOpecity)
//                    .disabled(signupVM.signUpModel.buttonValidation)
                    .alert(isPresented: $signupVM.signUpModel.isPresentingErrorAlert, content: {
                        Alert(title: Text("Alert"), message: Text(signupVM.signUpModel.error), dismissButton: .cancel(Text("Ok")))
                    })
                }
                SpacerView()
                AuthButtonsView()
                HStack{
                    Text("Already have an Account?")
                        .fontWeight(.regular)
                        .font(.system(size: 12))                
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Log In")
                            .foregroundColor(Color("highlight_color"))
                            .fontWeight(.regular)
                            .font(.system(size: 12))
                    }
                }
                
            }
        }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    
    }
}
