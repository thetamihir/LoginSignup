//
//  OnboardingDetailView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 24/05/23.
//

import SwiftUI

struct OnboardingDetailView: View {
    
    var detailes : OnBordingDetail
    
    
    var body: some View {
        VStack {
            Image(detailes.image)
                .padding(.bottom , 13)
            Text("BERRY JUICE")
                .font(Font.custom("AbrilFatface-Regular", size: 30))
                .fontWeight(.bold)
                .shadow(color: Color(hex: 0xFAA91E), radius: 5)
                .frame(width: 250 , height: 40)
                .padding(.bottom , 15)
            Text(detailes.description)
                .multilineTextAlignment(.center)
                .frame(width: 208 , height: 54)
                .font(.system(size: 15))
                .fontWeight(.light)
            Spacer()
            
        }
    }
}

struct OnboardingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingDetailView(detailes: .firstScreen)
    }
}
