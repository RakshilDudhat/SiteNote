//
//  Home.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct Home: View {
    
    @Binding var text: String
    @State var isPresentingFolder = false
    @State private var isEditing = false
    @State var isShowProjectFolde = true
    @EnvironmentObject var modelData: ModelData
    @State var isShowTODAY = false
    @State var showingProfile = false
    @State private var isEditProjectFolderActive = false
    @State var isToggle = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    
                    TextField("Search...", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    if isEditing {
                        Button {
                            self.isEditing = false
                            self.text = ""
                            self.endTextEditing()
                        } label: {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                    }
                }
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                    }
                )
                List {
                    //MARK: - TODAY
                    Section("TODAY") {
                        ForEach(modelData.todaydetalis, id: \.id) { todatDetalis in
                            NavigationLink {
                                if todatDetalis.id == 1 {
                                    AppointmentList()
                                        .navigationBarTitle("Appointement", displayMode: .inline)
                                } else {
                                    MyTask()
                                        .navigationBarTitle("Tasks", displayMode: .inline)
                                }
                            
                            } label: {
                                HomeItem(todayDetalis: todatDetalis)
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    
                    //MARK: - Small Houses
                    Section(header: HStack {
                        Text("Small Houses")
                        Spacer()
                        NavigationLink(isActive: $isEditProjectFolderActive) {
                            EditProjectFolder()
                                .navigationBarTitle("Edit Project Folder", displayMode: .automatic)
                                .toolbar(content: {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button("Cancel") {
                                            isEditProjectFolderActive = false
                                            EditProjectFolder().presentationMode.wrappedValue.dismiss()
                                        }.foregroundColor(.blue)
                                    }
                                })
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }) {
                        ForEach(modelData.smallHouse) { smallHouse in
                            NavigationLink {
                                if smallHouse.id == 1 {
                                    Leads()
                                        .navigationBarHidden(true)
//                                        .navigationBarTitle("Leads", displayMode: .inline)
//                                        .toolbar {
//                                            ToolbarItem(placement: .navigationBarTrailing) {
//                                                Button {
//                                                    print("Add")
//                                                } label: {
//                                                    Label("Add", image: "").labelStyle(.titleOnly)
//                                                }

//                                                NavigationLink {
////                                                    Settings()
//                                                } label: {
//                                                    Label("Add", image: "").labelStyle(.titleOnly)
//                                                }
//                                            }
//                                        }
                                }
                            } label: {
                                smallHouseRows(smallHouse: smallHouse).foregroundColor(.gray)
                            }

                                .listRowSeparator(.hidden)
                        }
                    }
                    
                    //MARK: - Large Houses
                    Section(header: HStack {
                        Text("Large Houses")
                        Spacer()
                        NavigationLink(isActive: $isEditProjectFolderActive) {
                            EditProjectFolder()
                                .navigationBarTitle("Edit Project Folder", displayMode: .automatic)
                                .toolbar(content: {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button("Cancel") {
                                            isEditProjectFolderActive = false
                                            EditProjectFolder().presentationMode.wrappedValue.dismiss()
                                        }.foregroundColor(.blue)
                                    }
                                })
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }) {
                        ForEach(modelData.smallHouse) { largeHouse in
                            smallHouseRows(smallHouse: largeHouse)
                                .listRowSeparator(.hidden)
                        }
                    }
                    
                    //MARK: - Special Project
                    Section(header: HStack {
                        Text("Special Project - 123 Some Street")
                        Spacer()
                        NavigationLink(isActive: $isEditProjectFolderActive) {
                            EditProjectFolder()
                                .navigationBarTitle("Edit Project Folder", displayMode: .automatic)
                                .toolbar(content: {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button("Cancel") {
                                            isEditProjectFolderActive = false
                                            EditProjectFolder().presentationMode.wrappedValue.dismiss()
                                        }.foregroundColor(.blue)
                                    }
                                })
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }) {
                        ForEach(modelData.smallHouse) { speacialProject in
                            smallHouseRows(smallHouse: speacialProject)
                                .listRowSeparator(.hidden)
                        }
                    }
                    //MARK: - Toggle
                    HStack {
                        Text("")
                            .frame(width: 3, height: 46)
                            .background(Color.green)
                        Spacer()
                        Toggle(isOn: $isToggle) {
                            Text("Show Hidden Folders")
                                .font(.system(size: 17))
                        }
                        .overlay(NavigationLink(destination: CompleteBusinessList().navigationBarTitle("Completed Business", displayMode: .automatic), label: {
                            CompleteBusinessList()
                        }).opacity(0))
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    }
                } .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Project Folders").bold()
                            .font(.system(size: 30))
                        Spacer()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NewProjectFolder()
                            .navigationBarTitle("New Project Folder", displayMode: .inline)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(text: .constant(""))
            .environmentObject(ModelData())
    }
}