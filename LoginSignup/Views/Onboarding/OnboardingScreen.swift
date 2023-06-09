//
//  ContentView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 24/05/23.
//

import SwiftUI

struct OnboardingScreen: View {
    
    @State var pageIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $pageIndex ) {
               
                OnboardingDetailView(detailes: .firstScreen).tag(0)
                OnboardingDetailView(detailes: .secondScreen).tag(1)
            
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Button {
               pageIndex = 1
            } label: {
                HStack{
                    Text("Explore Now")
                        .frame(width: 123 , height: 30)
                        .padding()
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Spacer()
                    Image("arrow_right")
                        .padding()
                }
            }
            .gradientButton()
        }
        .padding()
    }
}





struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}






