//
//  NewProjectFolder.swift
//  SiteNotes
//
//  Created by MacOS on 25/08/2023.
//

import SwiftUI

struct NewProjectFolder: View {
    
    @State var businessName: String = "Business Name"
    @State var leadName: String = "lead Name"
    @State var siteVisit: String = "Site Visit"
    @State var job: String = "Job"
    @State var installation: String = "Installation"
    @State var completed: String = "Completed"
    @State var isScrollDisable: Bool = false
    @State var isEditing = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Section("PROJECT FOLDER NAME") {
                        TextField("Business Name", text: $businessName).textFieldStyle(RoundedBorderTextFieldStyle())
                            .modifier(TextFieldClearButton(text: $businessName))
                            .multilineTextAlignment(.leading)
                        
                    } .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    Section("Project Steps") {
                        Group {
                            TextField("Lead Name", text: $leadName).textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                            TextField("Site Visit", text: $siteVisit).textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                            TextField("Job", text: $job).textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                            TextField("Installation", text: $installation).textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                            TextField("Completion", text: $completed).textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.leading)
                        }
                    }.swipeActions(content: {
                        Button {
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
