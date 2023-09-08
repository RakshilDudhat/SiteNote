//
//  NewContact.swift
//  SiteNotes
//
//  Created by MacOS on 08/09/2023.
//

import SwiftUI

struct NewContact: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var name = "John Smith"
    @State var phoneNumbr = ""
    @State var email = ""
    @State var location = ""
    
    var body: some View {
        NavigationView {
            List {
                TextField("", text: $name)
                HStack {
                    Image("Phone")
                        .resizable()
                        .frame(width: 18, height: 18)
                    TextField("Add Phone Number", text: $phoneNumbr)
                    
                }
                HStack {
                    Image("Mail")
                        .resizable()
                        .frame(width: 18, height: 18)
                    TextField("Add Mail ID", text: $email)
                }
                HStack {
                    Image("Location")
                        .resizable()
                        .frame(width: 18, height: 18)
                    TextField("Add Location", text: $location)
                }
            }.onTapGesture {
                dismissKeyboard()
            }
            
                .navigationBarTitle("New Contact", displayMode: .inline)
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

struct NewContact_Previews: PreviewProvider {
    static var previews: some View {
        NewContact()
    }
}
