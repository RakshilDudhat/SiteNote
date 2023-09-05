//
//  FilterList.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI

struct FilterList: View {
    
    @State var selection: String?
    
    var body: some View {
        List(ModelData().arrClientName, id: \.self, selection: $selection) { filter in
            Text(filter.name)
        }
    }
}

struct FilterList_Previews: PreviewProvider {
    static var previews: some View {
        FilterList()
    }
}
