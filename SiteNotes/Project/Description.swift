//
//  Description.swift
//  SiteNotes
//
//  Created by MacOS on 01/09/2023.
//

import SwiftUI

struct Description: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    
    var body: some View {
        NavigationView {
                ZStack {
                    Spacer()
                    Color(red: 240/255, green: 241/255, blue: 246/255).edgesIgnoringSafeArea(.all)
                    ScrollView(showsIndicators: false) {
                        TextEditor(text: $text)
                            .frame(minHeight: 130, maxHeight: .infinity)
                            .multilineTextAlignment(.leading)
                            .cornerRadius(10)
                            .font(.subheadline)
                            .disableAutocorrection(true)
                            .padding([.leading, .bottom, .trailing])
                    }.background(Color.clear)
                    .navigationBarTitle("Description", displayMode: .inline)
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

struct Description_Previews: PreviewProvider {
    static var previews: some View {
        Description()
    }
}
