//
//  ShowHiddenFolder.swift
//  SiteNotes
//
//  Created by MacOS on 25/08/2023.
//

import SwiftUI

struct ShowHiddenFolder: View {
    
    @State var isToggle = true
    
    var body: some View {
            HStack {
                Toggle(isOn: $isToggle) {
                    Text("Show Hidden Folders")
                        .font(.system(size: 17))
                }
            }.frame(minWidth: 200, maxWidth: 400)
    }
}

struct ShowHiddenFolder_Previews: PreviewProvider {
    static var previews: some View {
        ShowHiddenFolder()
    }
}
