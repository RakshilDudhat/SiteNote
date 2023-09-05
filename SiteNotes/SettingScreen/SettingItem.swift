//
//  SettingItem.swift
//  SiteNotes
//
//  Created by MacOS on 28/08/2023.
//

import SwiftUI

struct SettingItem: View {
    
    let arrSetting: SettingName
    
    var body: some View {
        HStack {
            Text(arrSetting.name)
            Spacer()
        }
    }
}

struct SettingItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingItem(arrSetting: ModelData().arrSetting[0])
            SettingItem(arrSetting: ModelData().arrSetting[1])
        }
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
