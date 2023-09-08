//
//  FindScreen.swift
//  SiteNotes
//
//  Created by MacOS on 28/08/2023.
//

import SwiftUI

struct FindScreen: View {
    
    @State var text: String
    @State private var isEditing = false
    @State var isFilterScreenOpen = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {
                        
                        TextField("Search Project", text: $text)
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
                        NavigationLink(isActive: $isFilterScreenOpen) {
                            FilterScreen()
                                .navigationBarTitle("Filter", displayMode: .inline)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Button {
                                            isFilterScreenOpen = false
                                            FilterScreen().presentationMode.wrappedValue.dismiss()
                                            print("Done")
                                        } label: {
                                            Label("Done", image: "")
                                                .labelStyle(.titleOnly)
                                        }
                                    }
                                }
                        } label: {
                            Label("Filters", image: "Tune")
                                .labelStyle(.iconOnly)
                        }
                        Spacer()
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
                            ForEach(ModelData().arrFindList, id: \.id) { lead in
                                ZStack {
                                        Rectangle()
                                        .cornerRadius(8)
                                        .frame(height: 104, alignment: .center)
                                        .foregroundColor(.white)
                                    NavigationLink {
                                        ProjectDetalis(leads: FindList(id: lead.id, listImgName: lead.listImgName, listName: lead.listName, listImgCircle: lead.listImgCircle, street: lead.street))
                                            .navigationBarHidden(true)
                                    } label: {
                                        ZStack {
                                            ProjectItem(findlist: lead)
                                        }
                                    }.padding(.all, 8.0)
                                }.padding(.all, 8.0)
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets())
                        .background(Color(red: 240/255, green: 241/255, blue: 246/255))
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct FindScreen_Previews: PreviewProvider {
    static var previews: some View {
        FindScreen(text: "")
    }
}
