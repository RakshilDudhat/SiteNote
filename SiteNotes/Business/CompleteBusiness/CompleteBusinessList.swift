//
//  CompleteBusinessList.swift
//  SiteNotes
//
//  Created by MacOS on 28/08/2023.
//

import SwiftUI

struct CompleteBusinessList: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            List {
                Section(header: HStack {
                    Text("Interior Design")
                    Spacer()
                    NavigationLink {
                        EditProjectFolder()
                            .navigationBarTitle("Edit Project Folder", displayMode: .automatic)
                    } label: {
                        Text("Edit")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                    }
                }.textCase(.none)) {
                    SmallHouseList()
                }
            }
        }
    }
}

struct CompleteBusinessList_Previews: PreviewProvider {
    static var previews: some View {
        CompleteBusinessList()
    }
}
