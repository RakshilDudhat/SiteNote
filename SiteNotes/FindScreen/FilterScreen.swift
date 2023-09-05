//
//  FilterScreen.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI

struct FilterScreen: View {
    
    @State var selection: String?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Form {
                Section("Client") {
                    List(ModelData().arrClientName, id: \.self, selection: $selection) { filter in
                        HStack {
                            Text(filter.name)
                            Spacer()
                            if filter.name == selection {
                                Image("Check")
                                    .foregroundColor(Color.blue)
                            }
                        }.contentShape(Rectangle())
                            .onTapGesture {
                                self.selection = filter.name
                            }
                    }
                }
            }
        }
    }
}

struct FilterScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilterScreen()
    }
}
