//
//  Project.swift
//  SiteNotes
//
//  Created by MacOS on 01/09/2023.
//

import SwiftUI

struct Project: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var name: String
    @State var street: String
    
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 241/255, blue: 246/255)
            NavigationView {
                VStack {
                    List {
                        TextField("123", text: $name)
                            .frame(height: 30)
                        TextField("123", text: $street)
                            .frame(height: 30)
                            .listRowSeparator(.hidden)
                    }
                }
                
                    .navigationBarTitle("Project", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel", role: .cancel) {
                                dismiss()
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done", role: .cancel) {
                                dismiss()
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

struct Project_Previews: PreviewProvider {
    static var previews: some View {
        Project(name: "", street: "")
    }
}
