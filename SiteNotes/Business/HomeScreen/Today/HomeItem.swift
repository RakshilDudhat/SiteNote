//
//  HomeItem.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct HomeItem: View {
    
    let todayDetalis: Today
    
    var body: some View {
            HStack {
                Image(todayDetalis.imageName)
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: 28, height: 28)
                Text(todayDetalis.name)
                    .font(.system(size: 17))
                Spacer()
                Text(todayDetalis.badge)
            }
    }
}

struct HomeItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeItem(todayDetalis: ModelData().todaydetalis[0])
            HomeItem(todayDetalis: ModelData().todaydetalis[1])
        }
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
