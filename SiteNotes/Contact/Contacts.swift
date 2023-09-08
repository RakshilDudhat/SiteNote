//
//  Contacts.swift
//  SiteNotes
//
//  Created by MacOS on 08/09/2023.
//

import SwiftUI

struct Contacts: View {
    var body: some View {
        NavigationView {
            Form {
                Section("CONTACT LIST") {
                    ForEach(ModelData().arrContactData, id: \.id) { contact in
                        ContactItem(contact: contact)
                    }
                }
                .listSectionSeparator(.hidden)
                .buttonStyle(.borderless)
            }
            
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Contacts").bold()
                                .font(.system(size: 30))
                            Spacer()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            NewContact().navigationBarHidden(true)
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
        }
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        Contacts()
    }
}
