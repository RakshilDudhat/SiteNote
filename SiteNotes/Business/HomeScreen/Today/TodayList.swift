//
//  TodayList.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct TodayList: View {
    
    @State var isScrollDisable = true
    
    var body: some View {
        VStack {
            List(ModelData().todaydetalis) { detalis in
                HomeItem(todayDetalis: detalis)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .onAppear {
                isScrollDisable = true
            }
            .disabled(isScrollDisable)
        }.frame(minWidth: 200, maxWidth: 350, minHeight: 90, maxHeight: 90)
    }
}

struct TodayList_Previews: PreviewProvider {
    
    static var detalis = ModelData().todaydetalis
    
    static var previews: some View {
        TodayList()
    }
}
