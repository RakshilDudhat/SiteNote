//
//  NewProjectFolder.swift
//  SiteNotes
//
//  Created by MacOS on 25/08/2023.
//

import SwiftUI

struct NewProjectFolder: View {
    
    @State var arrNewProjectList = ["Business Name", "lead Name", "Site Visit", "Job", "Installation", "Completed"]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Section("PROJECT FOLDER NAME") {
                        TextField("Business Name", text: $arrNewProjectList[0]).textFieldStyle(RoundedBorderTextFieldStyle())
                            .modifier(TextFieldClearButton(text: $arrNewProjectList[0]))
                            .multilineTextAlignment(.leading)
                    } .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    Section("Project Steps") {
                        Group {
                            TextField("Lead Name", text: $arrNewProjectList[1])
                            TextField("Site Visit", text: $arrNewProjectList[2])
                            TextField("Job", text: $arrNewProjectList[3])
                            TextField("Installation", text: $arrNewProjectList[4])
                            TextField("Completion", text: $arrNewProjectList[5])
                        }
                        .multilineTextAlignment(.leading)
                    }.textCase(.none)
                    .swipeActions(content: {
                        Button(role: .destructive) {
                            print("Hello")
                        } label: {
                            Label("Delete", systemImage: "")
                        }
                        .tint(.red)
                    })
                        .listRowSeparator(.hidden)
                    VStack {
                        HStack {
                            Button {
                                print("Hello")
                            } label: {
                                Label("Add New Status", systemImage: "plus")
                                    .tint(Color.gray)
                            }
                        }
                    }
                }
            }
        }.onTapGesture(perform: {
            self.endTextEditing()
        })
    }
}

struct NewProjectFolder_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectFolder()
    }
}
