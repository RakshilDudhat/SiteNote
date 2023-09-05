//
//  ProjectImage.swift
//  SiteNotes
//
//  Created by MacOS on 05/09/2023.
//

import SwiftUI

struct ProjectImage: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 240/255, green: 241/255, blue: 246/255)
                VStack {
                ZStack {
                    Image("test")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 255)
                }.frame(width: 325, height: 255)
                }.frame(maxWidth: .infinity, minHeight: 255, maxHeight: 255, alignment: .center).edgesIgnoringSafeArea(.all)
            }
            .edgesIgnoringSafeArea(.all)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("\(Image("Back"))") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            print("Print")
                        } label: {
                            Label("Set as main page", image: "Gallery")
                        }
                        Button(role: .destructive) {
                            print("Print")
                        } label: {
                            Label("Remove", image: "Delete")
                        }
                    } label: {
                        Label("", image: "3DotMenu")
                            .labelStyle(.iconOnly)
                    }
                }
            }
        }
    }
}

struct ProjectImage_Previews: PreviewProvider {
    static var previews: some View {
        ProjectImage()
    }
}
