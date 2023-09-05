//
//  LargeHouseList.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct LargeHouseList: View {
        
    var body: some View {
        VStack {
            List(ModelData().smallHouse) { detalis in
                smallHouseRows(smallHouse: detalis)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
            .disabled(true)
            .listStyle(PlainListStyle())
        }.frame(minWidth: 200, maxWidth: 350, minHeight: 230, maxHeight: 230)
    }
}

struct LargeHouseList_Previews: PreviewProvider {
    static var previews: some View {
        LargeHouseList()
    }
}
