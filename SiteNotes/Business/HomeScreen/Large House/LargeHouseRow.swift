//
//  LargeHouseRow.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct LargeHouseRow: View {
    
    let smallHouse: SmallHouse
    
    var body: some View {
        HStack {
            Text(smallHouse.name)
                .font(.system(size: 17))
            Spacer()
            Text(smallHouse.badge)
        }
    }
}

struct LargeHouseRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LargeHouseRow(smallHouse: ModelData().smallHouse[0])
            LargeHouseRow(smallHouse: ModelData().smallHouse[1])
        }
        .previewLayout(.sizeThatFits)
    }
}
