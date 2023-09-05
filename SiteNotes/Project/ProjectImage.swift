//
//  ProjectImage.swift
//  SiteNotes
//
//  Created by MacOS on 05/09/2023.
//

import SwiftUI

struct ProjectImage: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var description = "Lorem lpusm is simply dummy..."
    @State private var isTextFieldAtTop = false
    
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
                        VStack {
                            Spacer()
                            ZStack {
                                Group {
                                    Rectangle().frame(maxWidth: .infinity, maxHeight: 30).opacity(0.5)
                                    TextField("Lorem lpusm is simply dummy...", text: $description).foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                }.offset(y: isTextFieldAtTop ? -70 : 0)
                            }
                        }
                    }.frame(width: 325, height: 255)
                }.frame(maxWidth: .infinity, minHeight: 255, maxHeight: 255, alignment: .center).edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                    withAnimation {
                        isTextFieldAtTop = true
                    }
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                    withAnimation {
                        isTextFieldAtTop = false
                    }
                }
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
                    if isTextFieldAtTop == true {
                        Button("Done") {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }.onAppear {
                            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                                withAnimation {
                                    isTextFieldAtTop = false
                                }
                            }
                        }
                    } else {
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
}

struct ProjectImage_Previews: PreviewProvider {
    static var previews: some View {
        ProjectImage()
    }
}
