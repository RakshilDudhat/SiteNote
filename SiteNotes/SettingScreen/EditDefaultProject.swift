//
//  EditDefaultProject.swift
//  SiteNotes
//
//  Created by MacOS on 28/08/2023.
//

import SwiftUI

struct EditDefaultProject: View {
    
    var body: some View {
        ZStack {
            List {
                Section("Project Steps") {
                    ForEach(ModelData().arrEditProjectStatus) { editProject in
                        Text(editProject.name)
                    }
                }.textCase(.none)
                HStack {
                    Button {
                        print("Add New Status")
                    } label: {
                        Label("Add New Status", systemImage: "plus")
                            .tint(Color.gray)
                    }
                }
            }
        }
    }
}

struct EditDefaultProject_Previews: PreviewProvider {
    static var previews: some View {
        EditDefaultProject()
    }
}
