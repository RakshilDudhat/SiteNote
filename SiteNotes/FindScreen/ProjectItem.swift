//
//  ProjectItem.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI

struct ProjectItem: View {
    
    let findlist: FindList
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            HStack {
                Image(findlist.listImgName)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text(findlist.listName)
                        .lineSpacing(2)
                    HStack {
                        Image(findlist.listImgCircle)
                        Text(findlist.street).foregroundColor(.gray)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ProjectItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProjectItem(findlist: ModelData().arrFindList[0])
            ProjectItem(findlist: ModelData().arrFindList[1])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
