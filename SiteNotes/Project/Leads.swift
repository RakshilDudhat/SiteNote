//
//  Leads.swift
//  SiteNotes
//
//  Created by MacOS on 01/09/2023.
//

import SwiftUI

struct Leads: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
        NavigationView {
                List {
                    Section("INTERIOR DESIGN") {
                        ForEach(ModelData().arrLead, id: \.id) { lead in
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
                    }
                    .background(Color(red: 240/255, green: 241/255, blue: 246/255))
                }
                .background(Color(red: 240/255, green: 241/255, blue: 246/255))
                .navigationBarTitle("Leads", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("Back")
                        }
                    }
                }
            }
        }
    }
   private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct Leads_Previews: PreviewProvider {
    static var previews: some View {
        Leads()
    }
}
