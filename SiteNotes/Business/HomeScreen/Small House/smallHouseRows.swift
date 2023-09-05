//
//  smallHouseRows.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct smallHouseRows: View {
    
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

struct smallHouseRows_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            smallHouseRows(smallHouse: ModelData().smallHouse[0])
            smallHouseRows(smallHouse: ModelData().smallHouse[1])
        }
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
