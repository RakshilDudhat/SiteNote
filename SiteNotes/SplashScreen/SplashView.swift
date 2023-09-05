//
//  SplashView.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Image("SiteNote Logo")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 309, height: 43.09)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
