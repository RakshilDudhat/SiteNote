//
//  NewNotes.swift
//  SiteNotes
//
//  Created by MacOS on 02/09/2023.
//

import SwiftUI

struct NewNotes: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = "Lorem lpusm"
    @State var description: String = ""
    @State private var isDetailViewPresented = false
    
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 241/255, blue: 246/255)
            NavigationView {
                List {
                    TextField("Lorem Lpusm", text: $name)
                    TextField("Add Description", text: $description)
                    VStack(alignment: .leading) {
                        Text("Add Image").font(Font.custom("body", size: 17)).foregroundColor(.gray)
                        HStack {
                            Image("Notes")
                                .resizable()
                                .frame(width: 64, height: 64)
                            Image("Notes2")
                                .resizable()
                                .frame(width: 64, height: 64)
                        }
                    }
                }
                
                    .navigationBarTitle("New Note", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel", role: .cancel) {
                                dismiss()
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done", role: .cancel) {
                                dismiss()
                            }.sheet(isPresented: $isDetailViewPresented) {}
                        }
                    }
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewNotes_Previews: PreviewProvider {
    static var previews: some View {
        NewNotes()
    }
}
