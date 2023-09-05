//
//  Subscribe.swift
//  SiteNotes
//
//  Created by MacOS on 02/09/2023.
//

import SwiftUI

struct Subscribe: View {
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 241/255, blue: 246/255)
            VStack {
                List {
                    Section("Subscribe") {
                        VStack(alignment: .leading, spacing: 32) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Please Subscribe to access this feature").font(Font.custom("Subhead", size: 17))
                                Text("You will get ads free access to the app and get feature to forwad notes and tasks as an emal.").font(Font.custom("Footnote", size: 13)).foregroundColor(Color(red: 134/255, green: 142/255, blue: 150/255))
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("MONTHLY").font(Font.custom("caption1", size: 12)).foregroundColor(Color(red: 134/255, green: 142/255, blue: 150/255))
                                Text("$3.99/month")
                            }
                        }
                    }.textCase(.none)
                    VStack(alignment: .center) {
                        Button("Subscribe") {
                            print("Subscribe")
                        }.frame(maxWidth: .infinity).foregroundColor(.white)
                    }.frame(maxWidth: .infinity, maxHeight: 50).background(Color.blue).cornerRadius(10)
                        .listRowBackground(Color.clear)
                    
                    VStack(alignment: .center) {
                        Button("Cancel") {
                            print("Cancel")
                        }.frame(maxWidth: .infinity).foregroundColor(.black)
                    }.frame(maxWidth: .infinity, maxHeight: 50).background(Color.white).cornerRadius(10)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
            }
        }
    }
}

struct Subscribe_Previews: PreviewProvider {
    static var previews: some View {
        Subscribe()
    }
}
