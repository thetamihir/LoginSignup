//
//  SwiftUIView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import SwiftUI

struct UpperTitleView: View {
    
    var title : String
    var subTitle : String
    
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .font(.system(size: 30))
        Text(subTitle)
            .font(.system(size: 18))
            .padding(.bottom)
    }
}

struct UpperTitleView_Previews: PreviewProvider {
    static var previews: some View {
        UpperTitleView(title: "", subTitle: "")
       
    }
}
