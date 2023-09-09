//
//  ContactItem.swift
//  SiteNotes
//
//  Created by MacOS on 08/09/2023.
//

import SwiftUI

struct ContactItem: View {
    
    var contact: Contact
    @State var showingAlert = false
    @State private var isEditViewActive = false
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(contact.name)
                Spacer()
                
                Button("\(Image("Edit"))") {
                    isEditViewActive.toggle()
                }.buttonStyle(.borderless)
                .overlay(NavigationLink("", destination: EditContact(fetchData: Contact(id: contact.id, name: contact.name, moNumber: contact.moNumber, email: contact.email, loction: contact.loction)).navigationBarHidden(true), isActive: $isEditViewActive).opacity(0))
                
                Button {
                    print("Delete")
                    showingAlert = true
                } label: {
                    Image(systemName: "trash")
//                        .resizable()
//                        .frame(width: 24, height: 24)
                        .foregroundColor(.red)
                }
            }
            
            HStack {
                Image("Phone-1")
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(contact.moNumber).font(.system(size: 14)).foregroundColor(.gray)
                Spacer()
            }
            
            HStack {
                Image("Mail-1")
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(contact.email).font(.system(size: 14)).foregroundColor(.gray)
                Spacer()
            }
            
            HStack {
                Image("Location")
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(contact.loction).font(.system(size: 14)).foregroundColor(.gray)
                Spacer()
                Button {
                    print("Call")
                } label: {
                    Image("call")
                        .frame(width: 26, height: 26)
                        .aspectRatio(contentMode: .fill)
                }
                
                Button {
                    print("paperplane")
                } label: {
                    Image("paperplane")
                        .frame(width: 26, height: 26)
                        .aspectRatio(contentMode: .fill)
                }
                
                Button {
                    print("envelope")
                } label: {
                    Image("envelope")
                        .frame(width: 26, height: 26)
                        .aspectRatio(contentMode: .fill)
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            let firstButton = Alert.Button.default(Text("Cancel")) { showingAlert = false }
            let secondButton = Alert.Button.destructive(Text("Delete")) { showingAlert = false }
            return Alert(title: Text("Delete Appointement?"), message: Text("Are you sure you want Zpermanently delete this appointement?"), primaryButton: firstButton, secondaryButton: secondButton)
        }
    }
}

struct ContactItem_Previews: PreviewProvider {
    static var previews: some View {
        ContactItem(contact: ModelData().arrContactData[0])
            .previewLayout(.sizeThatFits)
    }
}
