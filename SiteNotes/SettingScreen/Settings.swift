//
//  Settings.swift
//  SiteNotes
//
//  Created by MacOS on 28/08/2023.
//

import SwiftUI

struct Settings: View {
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(ModelData().arrSetting, id: \.id) { setting in
                        NavigationLink {
                            switch setting.id {
                            case 1, 2, 3 , 4: EditDefaultProject().navigationBarTitle(setting.name, displayMode: .inline)
                            case 5: Subscribe().navigationBarTitle("Subscribe", displayMode: .inline)
                            default: EditDefaultProject().navigationBarTitle(setting.name, displayMode: .inline)
                            }
                        } label: {
                            SettingItem(arrSetting: setting)
                        }
                    }
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
