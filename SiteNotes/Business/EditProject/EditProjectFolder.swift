//
//  EditProjectFolder.swift
//  SiteNotes
//
//  Created by MacOS on 26/08/2023.
//

import SwiftUI

struct EditProjectFolder: View {
    
    @State var editProjectName = "Interior Desi"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section("BUSINESS") {
                        TextField("Edit Project Name", text: $editProjectName).textFieldStyle(RoundedBorderTextFieldStyle())
                            .modifier(TextFieldClearButton(text: $editProjectName))
                            .multilineTextAlignment(.leading)
                    }.listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    Section("Hide Folder") {
                        ShowHiddenFolder()
                    }.textCase(.none)
                    
                    Section("Status") {
                        VStack {
                            List(ModelData().arrEditProjectStatus) { status in
                                smallHouseRows(smallHouse: status)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(.hidden)
                            }
                            .disabled(true)
                            .listStyle(PlainListStyle())
                        }.frame(minWidth: 200, maxWidth: 350, minHeight: 230, maxHeight: 230)
                    }.textCase(.none)
                    
                    Section("Delete Folder") {
                        DeleteFolderRow().buttonStyle(.borderless)
                    }.textCase(.none)
                }
            }
            .navigationBarTitle("Edit Project Folder", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditProjectFolder_Previews: PreviewProvider {
    static var previews: some View {
        EditProjectFolder()
    }
}
