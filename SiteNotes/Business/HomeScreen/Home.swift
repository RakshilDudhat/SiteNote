//
//  Home.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct Home: View {
    
    @State var text: String
    @State private var isEditing = false
    @EnvironmentObject var modelData: ModelData
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
                Form {
                    //MARK: - TODAY
                    Section("TODAY") {
                        ForEach(modelData.todaydetalis, id: \.id) { todatDetalis in
                            NavigationLink {
                                if todatDetalis.id == 1 {
                                    AppointmentList()
                                        .navigationBarHidden(true)
                                } else {
                                    MyTask()
                                        .navigationBarHidden(true)
                                }
                            } label: {
                                HomeItem(todayDetalis: todatDetalis)
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                    
                    //MARK: - Small Houses
                    Section(header: HStack {
                        Text("Small Houses")
                        Spacer()
                        NavigationLink {
                            EditProjectFolder().navigationBarHidden(true)
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }.textCase(.none)) {
                        ForEach(modelData.smallHouse) { smallHouse in
                            NavigationLink {
                                Leads()
                                    .navigationBarHidden(true)
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
                        NavigationLink {
                            EditProjectFolder().navigationBarHidden(true)
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }.textCase(.none)) {
                        ForEach(modelData.smallHouse) { largeHouse in
                            NavigationLink {
                                Leads()
                                    .navigationBarHidden(true)
                            } label: {
                                smallHouseRows(smallHouse: largeHouse)
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                    
                    //MARK: - Special Project
                    Section(header: HStack {
                        Text("Special Project - 123 Some Street")
                        Spacer()
                        NavigationLink {
                            EditProjectFolder().navigationBarHidden(true)
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }.textCase(.none)) {
                        ForEach(modelData.smallHouse) { speacialProject in
                            NavigationLink {
                                Leads()
                                    .navigationBarHidden(true)
                            } label: {
                                smallHouseRows(smallHouse: speacialProject)
                            }
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
                } .listStyle(.plain).background(Color(red: 240/255, green: 241/255, blue: 246/255))
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
        Home(text: "")
            .environmentObject(ModelData())
    }
}
