//
//  Status.swift
//  SiteNotes
//
//  Created by MacOS on 01/09/2023.
//

import SwiftUI

struct Status: View {
    
    @State var selection: String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 241/255, blue: 246/255)
            NavigationView {
                List {
                    ForEach(ModelData().arrStatus, id: \.id) { status in
                        HStack {
                            Text(status.status)
                            Spacer()
                            if status.status == selection {
                                Image("Check")
                                    .foregroundColor(Color.blue)
                            }
                        }.contentShape(Rectangle())
                            .onTapGesture {
                                self.selection = status.status
                            }
                    }
                }
                .navigationBarTitle("Status", displayMode: .inline)
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

struct Status_Previews: PreviewProvider {
    static var previews: some View {
        Status()
    }
}
