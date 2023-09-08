//
//  EditContact.swift
//  SiteNotes
//
//  Created by MacOS on 08/09/2023.
//

import SwiftUI

struct EditContact: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var fetchData: Contact
    @State var name = "John Smith"
    @State var phoneNumbr = ""
    @State var email = ""
    @State var location = ""
    
    var body: some View {
        NavigationView {
            List {
                TextField("", text: $fetchData.name)
                HStack {
                    Image("Phone-1")
                        .resizable()
                        .frame(width: 18, height: 18)
                    TextField("Add Phone Number", text: $fetchData.moNumber)
                }
                
                HStack {
                    Image("Mail-1")
                        .resizable()
                        .foregroundColor(Color(red: 73/255, green: 80/255, blue: 87/255))
                        .frame(width: 18, height: 18)
                    TextField("Add Mail ID", text: $fetchData.email)
                }
                
                HStack {
                    Image("Location-1")
                        .resizable()
                        .foregroundColor(Color(red: 134/255, green: 142/255, blue: 150/255))
                        .frame(width: 18, height: 18)
                    TextField("Add Location", text: $fetchData.loction)
                }
            }.onTapGesture {
                dismissKeyboard()
            }
            
            .navigationBarTitle("Edit Contact", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done", role: .cancel) {
                        dismissKeyboard()
                        dismiss()
                    }
                }
            }
        }
    }
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    func dismissKeyboard() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let relevantWindows = windowScene.windows.filter { $0.isKeyWindow }
            relevantWindows.first?.endEditing(true)
        }
    }
}

struct EditContact_Previews: PreviewProvider {
    static var previews: some View {
        EditContact(fetchData: Contact(id: 0, name: "", moNumber: "", email: "", loction: ""))
    }
}
